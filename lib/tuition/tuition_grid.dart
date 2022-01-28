import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:hamyar/tuition/tuition_card.dart';
import 'package:hamyar/models/students.dart';

class TuitionGrid extends StatelessWidget {
  const TuitionGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final studentsData = Provider.of<Students>(context);
    final students = studentsData
        .studentsFilteredByDate(studentsData.desiredMonthForPayment);
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 250,
        mainAxisSpacing: 5,
        crossAxisSpacing: 3,
        childAspectRatio: 5 / 4,
      ),
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
        value: students[index],
        child: const TuitionCard(),
      ),
      itemCount: students.length,
    );
  }
}
