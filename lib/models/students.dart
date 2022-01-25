import 'package:flutter/foundation.dart';

import 'package:hamyar/models/roll_call.dart';
import 'package:hamyar/models/tuition.dart';
import 'student.dart';
import 'package:hamyar/temp_data.dart';
import 'package:hamyar/models/date.dart';

class Students with ChangeNotifier {
  final List<Student> _students = studentsList;
  DateTime desiredDateForRollCall = Date.now();
  DateTime desiredMonthForPayment = Date.currentMonth();
  double _requiredAmount = 50;

  List<Student> get students => _students;

  void addStudent(Student student) {
    _students.add(student);
    notifyListeners();
  }

  // ----------------- roll-call -----------------

  void resetDesiredDate() {
    desiredDateForRollCall = Date.now();
  }

  void resetRollCall(DateTime date) {
    for (var student in _students) {
      student.setRollCall(RollCall(date: date, status: false));
    }
    notifyListeners();
  }

  void checkAllRollCall(DateTime date) {
    for (var student in _students) {
      student.setRollCall(RollCall(date: date, status: true));
    }
    notifyListeners();
  }

  void removeIfAllAbsent(DateTime date) {
    for (var student in students) {
      final index = student.presenceStatus.indexWhere(
          (rollCall) => rollCall.date == date && rollCall.status == true);
      if (index >= 0) {
        // found at least one who was present at the time
        return;
      }
    }
    // found no one present at the time
    for (var student in students) {
      student.presenceStatus.removeWhere((element) => element.date == date);
    }
  }

  void initializeRollCall(DateTime date) {
    for (var student in students) {
      student.setInitRollCall(date);
    }
  }

  // ----------------- tuition -----------------

  void setDesiredMonth(DateTime date) {
    desiredMonthForPayment = date;
    notifyListeners();
  }

  void resetDesiredMonth() {
    desiredMonthForPayment = Date.currentMonth();
  }

  double _totalPaymentsForThisMonth(DateTime date) {
    double _result = 0;
    for (var student in students) {
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
          .firstWhere((tuition) => tuition.date == desiredMonthForPayment)
          .requiredAmount;
    }
    // todo: required amount can be changed only once (shouldn't be like this - fix it)
    for (var student in students) {
      student.setInitPayment(date, _requiredAmount);
    }
  }

  void removeIfAllNotPaid(DateTime date) {
    for (var student in students) {
      final index = student.paymentsStatus.indexWhere(
          (tuition) => tuition.date == date && tuition.paymentAmount != 0);
      if (index >= 0) {
        // found at least one who paid at the time
        return;
      }
    }
    // found no one paid at the time
    for (var student in students) {
      student.paymentsStatus.removeWhere((tuition) => tuition.date == date);
    }
  }

  set requiredAmount(double value) {
    _requiredAmount = value;
    notifyListeners();
  }

  double get requiredAmount => _requiredAmount;
}
