import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'my_line_chart.dart';
import 'package:hamyar/helpers/chart_helper.dart';
import 'package:hamyar/models/students.dart';
import 'package:hamyar/general_info/rotated_title.dart';

class LastYearCharts extends StatelessWidget {
  final Size deviceSize;
  const LastYearCharts({
    Key? key,
    required this.deviceSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final studentsData = Provider.of<Students>(context, listen: false);
    return Row(
      children: [
        RotatedTitle(
          title: 'LAST 12 MONTHS',
          height: deviceSize.height * 0.35,
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            height: deviceSize.height * 0.35,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.all(14.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'roll-calls',
                  style: TextStyle(
                    color: Theme.of(context).canvasColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: MyLineChart(
                    spots: getPrStatOfYearForAllInSpots(studentsData),
                  ),
                ),
                const Divider(height: 20),
                Expanded(
                  child: MyLineChart(
                    spots: getTuStatOfYearForAllInSpots(studentsData),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'payments',
                  style: TextStyle(
                    color: Theme.of(context).canvasColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
