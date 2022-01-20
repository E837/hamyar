import 'package:flutter/foundation.dart';

import 'package:hamyar/models/roll_call.dart';
import 'student.dart';
import 'package:hamyar/temp_data.dart';

class Students with ChangeNotifier {
  final List<Student> _students = studentsList;

  List<Student> get students => _students;

  void addStudent(Student student) {
    _students.add(student);
    notifyListeners();
  }

  void rollCall(List<RollCall> rollCallList) {
    for (var rollCallItem in rollCallList) {
      final thisStudent = _students
          .firstWhere((student) => student.id == rollCallItem.studentId);
      thisStudent.addRollCallStat(rollCallItem);
    }
  }
}
