import 'package:flutter/material.dart';
import 'package:hamyar/student_card.dart';

class StudentsGrid extends StatelessWidget {
  const StudentsGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 150,
        childAspectRatio: 2 / 3,
      ),
      itemCount: 21,
      itemBuilder: (context, index) => const Student(),
    );
  }
}
