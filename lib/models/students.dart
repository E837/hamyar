import 'package:flutter/foundation.dart';

import 'package:hamyar/models/roll_call.dart';
import 'student.dart';
import 'package:hamyar/temp_data.dart';
import 'package:hamyar/models/date.dart';

class Students with ChangeNotifier {
  final List<Student> _students = studentsList;
  DateTime desiredDateForRollCall = Date.now();

  List<Student> get students => _students;

  void resetDesiredDate() {
    desiredDateForRollCall = Date.now();
  }

  void addStudent(Student student) {
    _students.add(student);
    notifyListeners();
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
        print('found at least one who was present at the time');
        return;
      }
    }
    print('found no one present at the time');
    for (var student in students) {
      student.presenceStatus.removeWhere((element) => element.date == date);
    }
  }

  void initializeRollCall(DateTime date) {
    for (var student in students) {
      student.setInitRollCall(date);
    }
  }
}
