import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

class MyLineChart extends StatelessWidget {
  final List<FlSpot> spots;
  const MyLineChart({
    Key? key,
    required this.spots,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        // minX: 0,
        // maxX: 11,
        // minY: 0,
        // maxY: 100,
        borderData: FlBorderData(show: false),
        gridData: FlGridData(show: false),
        lineTouchData: LineTouchData(
          touchTooltipData: LineTouchTooltipData(
            tooltipBgColor: Theme.of(context).canvasColor,
          ),
        ),
        titlesData: FlTitlesData(
          show: true,
          topTitles: SideTitles(),
          rightTitles: SideTitles(),
          leftTitles: SideTitles(),
          bottomTitles: SideTitles(
            showTitles: true,
            getTextStyles: (ctx, i) => const TextStyle(
              fontSize: 10,
            ),
            getTitles: (i) {
              return DateFormat.MMM().format(
                DateTime(DateTime.now().year,
                    DateTime.now().month - (spots.length - 1 - i.toInt())),
                // it's like what we have done on "chart_helper.dart(FlSpot functions)" - and that "-1" is because length is always 1 more than index
              );
            },
            reservedSize: 5,
          ),
        ),
        axisTitleData: FlAxisTitleData(
            leftTitle: AxisTitle(
          showTitle: true,
          titleText: 'percent',
        )),
        lineBarsData: [
          LineChartBarData(
            isCurved: true,
            colors: [
              Theme.of(context).colorScheme.primaryVariant,
              Theme.of(context).canvasColor,
            ],
            // gradientFrom: Offset(0, .6),
            // gradientTo: Offset(0, 0),
            belowBarData: BarAreaData(
              show: true,
              colors: [
                Theme.of(context).colorScheme.primaryVariant,
                Theme.of(context).colorScheme.primary,
              ],
            ),
            spots: spots,
          ),
        ],
      ),
    );
  }
}
