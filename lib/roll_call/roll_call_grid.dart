import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'roll_call_item.dart';
import 'package:hamyar/models/students.dart';
import 'package:hamyar/models/student.dart';

class RollCallGrid extends StatelessWidget {
  const RollCallGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final studentsData = Provider.of<Students>(context);
    final students = studentsData
        .studentsFilteredByDate(studentsData.desiredDateForRollCall);
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 100,
        childAspectRatio: 1,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) => ChangeNotifierProvider<Student>.value(
        value: students[index],
        child: const RollCallItem(),
      ),
      itemCount: students.length,
      padding: const EdgeInsets.symmetric(horizontal: 8),
    );
  }
}
