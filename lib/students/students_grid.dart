import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:hamyar/students/student_card.dart';
import 'package:hamyar/models/students.dart';
import 'package:hamyar/models/student.dart';

class StudentsGrid extends StatelessWidget {
  const StudentsGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final students = Provider.of<Students>(context).students;
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 150,
        childAspectRatio: 2 / 3,
      ),
      itemCount: students.length,
      itemBuilder: (context, index) => ChangeNotifierProvider<Student>.value(
        value: students[index],
        child: const StudentCard(),
      ),
    );
  }
}
