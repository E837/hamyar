import 'package:flutter/foundation.dart';

import 'student.dart';

class Students with ChangeNotifier {
  final List<Student> _students = [];

  void addStudent(Student student) {
    _students.add(student);
    notifyListeners();
  }
}
