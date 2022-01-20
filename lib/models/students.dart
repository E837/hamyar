import 'package:flutter/foundation.dart';

import 'student.dart';
import 'package:hamyar/temp_data.dart';

class Students with ChangeNotifier {
  final List<Student> _students = studentsList;

  List<Student> get students => _students;

  void addStudent(Student student) {
    _students.add(student);
    notifyListeners();
  }
}
