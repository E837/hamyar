import 'package:flutter/material.dart';

import 'package:hamyar/models/roll_call.dart';
import 'package:hamyar/models/tuition.dart';
import 'student.dart';
import 'package:hamyar/temp_data.dart';
import 'package:hamyar/models/date.dart';

class Students with ChangeNotifier {
  final List<Student> _students = studentsList;
  DateTime _desiredDateForRollCall = Date.now();
  DateTime _desiredMonthForPayment = Date.currentMonth();
  double _requiredAmount = 50;

  // ----------------- students -----------------

  List<Student> get students => _students;

  void addStudent(Student student) {
    _students.add(student);
    notifyListeners();
  }

  List<Student> studentsFilteredByDate(DateTime date) {
    final List<Student> result = [];
    for (var student in _students) {
      if (student.joinDate.isBefore(date) ||
          student.joinDate.isAtSameMomentAs(date)) {
        result.add(student);
      }
    }
    return result;
  }

  void checkForDuplicates() {
    // todo: check for any duplications when user wants to submit a new student
  }

  // ----------------- roll-call -----------------

  DateTime get desiredDateForRollCall => _desiredDateForRollCall;

  set desiredDateForRollCall(DateTime value) {
    _desiredDateForRollCall = value;
    notifyListeners();
  }

  void resetDesiredDate() {
    _desiredDateForRollCall = Date.now();
  }

  void resetRollCall() {
    for (var student in studentsFilteredByDate(desiredDateForRollCall)) {
      student
          .setRollCall(RollCall(date: desiredDateForRollCall, status: false));
    }
    notifyListeners();
  }

  void checkAllRollCall() {
    for (var student in studentsFilteredByDate(desiredDateForRollCall)) {
      student.setRollCall(RollCall(date: desiredDateForRollCall, status: true));
    }
    notifyListeners();
  }

  void removeIfAllAbsent(DateTime date) {
    for (var student in studentsFilteredByDate(desiredDateForRollCall)) {
      final index = student.presenceStatus.indexWhere(
          (rollCall) => rollCall.date == date && rollCall.status == true);
      if (index >= 0) {
        // found at least one who was present at the time
        return;
      }
    }
    // found no one present at the time
    for (var student in studentsFilteredByDate(desiredDateForRollCall)) {
      student.presenceStatus.removeWhere((element) => element.date == date);
    }
  }

  void initializeRollCall(DateTime date) {
    for (var student in studentsFilteredByDate(desiredDateForRollCall)) {
      student.setInitRollCall(date);
    }
  }

  // ----------------- tuition -----------------

  DateTime get desiredMonthForPayment => _desiredMonthForPayment;

  void setDesiredMonth(DateTime date) {
    _desiredMonthForPayment = date;
    notifyListeners();
  }

  void resetDesiredMonth() {
    _desiredMonthForPayment = Date.currentMonth();
  }

  double _totalPaymentsForThisMonth(DateTime date) {
    double _result = 0;
    for (var student in studentsFilteredByDate(desiredMonthForPayment)) {
      _result += student.paymentsStatus
          .firstWhere((tuition) => tuition.date == date,
              orElse: () => Tuition(
                    date: date,
                    paymentAmount: 0,
                    requiredAmount: 0,
                  ))
          .paymentAmount;
    }
    return _result;
  }

  void initializeTuition(DateTime date, bool isEditing) {
    if (!isEditing && _totalPaymentsForThisMonth(date) != 0) {
      _requiredAmount = students.first.paymentsStatus
          .firstWhere((tuition) => tuition.date == _desiredMonthForPayment)
          .requiredAmount;
    }
    for (var student in studentsFilteredByDate(desiredMonthForPayment)) {
      student.setInitPayment(date, _requiredAmount);
    }
  }

  void removeIfAllNotPaid(DateTime date) {
    for (var student in studentsFilteredByDate(desiredMonthForPayment)) {
      final index = student.paymentsStatus.indexWhere(
          (tuition) => tuition.date == date && tuition.paymentAmount != 0);
      if (index >= 0) {
        // found at least one who paid at the time
        return;
      }
    }
    // found no one paid at the time
    for (var student in studentsFilteredByDate(desiredMonthForPayment)) {
      student.paymentsStatus.removeWhere((tuition) => tuition.date == date);
    }
  }

  set requiredAmount(double value) {
    _requiredAmount = value;
    notifyListeners();
  }

  double get requiredAmount => _requiredAmount;
}
