import 'package:uuid/uuid.dart';

import 'package:hamyar/models/student.dart';

class Group {
  String id = const Uuid().v1();
  List<Student> students;

  Group({
    required this.students,
  });
}
