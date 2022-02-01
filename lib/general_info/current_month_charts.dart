import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'my_pie_chart.dart';
import 'package:hamyar/general_info/rotated_title.dart';
import 'package:hamyar/models/students.dart';
import 'package:hamyar/helpers/chart_helper.dart';

class CurrentMonthCharts extends StatelessWidget {
  final Size deviceSize;
  const CurrentMonthCharts({
    Key? key,
    required this.deviceSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final studentsData = Provider.of<Students>(context, listen: false);
    final deviceSize = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RotatedTitle(
          title: 'THIS MONTH',
          height: deviceSize.height * 0.2,
        ),
        Column(
          children: [
            SizedBox(
              width: deviceSize.height * 0.16,
              height: deviceSize.height * 0.16,
              child: MyPieChart(
                fillPercent: getPrAvgOfAllForMonth(studentsData),
              ),
            ),
            const SizedBox(height: 10),
            const Text('Presence'),
          ],
        ),
        Column(
          children: [
            SizedBox(
              width: deviceSize.height * 0.16,
              height: deviceSize.height * 0.16,
              child: MyPieChart(
                fillPercent: getTuAvgOfAllForMonth(studentsData),
              ),
            ),
            const SizedBox(height: 10),
            const Text('Payments'),
          ],
        ),
        SizedBox(width: deviceSize.width * 0.02),
      ],
    );
  }
}
