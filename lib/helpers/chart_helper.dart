import 'package:fl_chart/fl_chart.dart';

import 'package:hamyar/models/date.dart';
import 'package:hamyar/models/student.dart';
import 'package:hamyar/models/students.dart';
import 'package:hamyar/models/tuition.dart';

double getPrStatOfMonth(Student student, {DateTime? desiredMonth}) {
  final targetMonth = desiredMonth ?? Date.currentMonth();
  final prStatForThisMonth = student.presenceStatus.where((element) =>
      element.date.year == targetMonth.year &&
      element.date.month == targetMonth.month); // this month roll-calls
  final length = prStatForThisMonth.length;
  int pCount = 0; // count of roll-calls which this student was present in them
  for (var e in prStatForThisMonth) {
    if (e.status) {
      pCount++;
    }
  }
  // the return will be 0 < x < 1
  return length == 0 ? 0 : pCount / length;
}

double getPrAvgOfAllForMonth(Students studentsData, {DateTime? desiredMonth}) {
  final targetMonth = desiredMonth ?? Date.currentMonth();
  final students = studentsData.studentsFilteredByDate(targetMonth);
  double sum = 0;
  for (var s in students) {
    sum += getPrStatOfMonth(s, desiredMonth: targetMonth);
  }
  double result = 0;
  if (students.isNotEmpty) {
    result = (sum / students.length * 100).roundToDouble();
  }
  // the return will be a percentage
  return result;
}

List<FlSpot> getPrStatOfYearForAllInSpots(Students studentsData) {
  final List<FlSpot> result = [];
  for (int i = 0; i <= 11; i++) {
    result.add(FlSpot(
      i.toDouble(),
      getPrAvgOfAllForMonth(
        studentsData,
        desiredMonth:
            DateTime(DateTime.now().year, DateTime.now().month - (11 - i)),
        // this "- (11 - i)" will help us to show the current month as the last month in the chart
      ),
    ));
  }
  return result;
}

double getTuStatOfMonth(Student student, {DateTime? desiredMonth}) {
  final targetMonth = desiredMonth ?? Date.currentMonth();
  final thisTuition = student.paymentsStatus.firstWhere(
    (element) => element.date == targetMonth,
    orElse: () =>
        // just a temporary tuition to avoid errors with 0 payment inside
        Tuition(date: Date.currentMonth(), paymentAmount: 0, requiredAmount: 1),
  ); // this month tuition
  // the return will be 0 < x < 1
  return thisTuition.paymentAmount / thisTuition.requiredAmount;
}

double getTuAvgOfAllForMonth(Students studentsData, {DateTime? desiredMonth}) {
  final targetMonth = desiredMonth ?? Date.currentMonth();
  final students = studentsData.studentsFilteredByDate(targetMonth);
  double sum = 0;
  for (var s in students) {
    sum += getTuStatOfMonth(s, desiredMonth: targetMonth);
  }
  double result = 0;
  if (students.isNotEmpty) {
    result = (sum / students.length * 100).roundToDouble();
  }
  // the return will be a percentage
  return result;
}

List<FlSpot> getTuStatOfYearForAllInSpots(Students studentsData) {
  final List<FlSpot> result = [];
  for (int i = 0; i <= 11; i++) {
    result.add(FlSpot(
      i.toDouble(),
      getTuAvgOfAllForMonth(
        studentsData,
        desiredMonth:
            DateTime(DateTime.now().year, DateTime.now().month - (11 - i)),
        // this "- (11 - i)" will help us to show the current month as the last month in the chart
      ),
    ));
  }
  return result;
}
