import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class MyPieChart extends StatelessWidget {
  final double fillPercent;
  const MyPieChart({
    Key? key,
    required this.fillPercent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        // centerSpaceRadius: 50,
        sections: [
          PieChartSectionData(
            value: fillPercent,
            color: Theme.of(context).colorScheme.primary,
          ),
          PieChartSectionData(
            showTitle: false,
            value: 100 - fillPercent,
            color: Theme.of(context).colorScheme.primary.withAlpha(110),
          ),
        ],
      ),
    );
  }
}
