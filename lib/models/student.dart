import 'package:flutter/cupertino.dart';

class Student {
  String id;
  Map<String, String> phone;
  String name;
  String lName;
  DateTime joinDate;
  String? avatar; // should be in file format

  Student({
    required this.id,
    required this.phone,
    required this.name,
    required this.lName,
    required this.joinDate,
    this.avatar,
  });
}

class Students with ChangeNotifier {
  final List<Student> _students = [];

  void addStudent(Student student) {
    _students.add(student);
    notifyListeners();
  }
}
