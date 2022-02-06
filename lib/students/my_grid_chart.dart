import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:hamyar/models/student.dart';

enum ChartType {
  rollCall,
  tuition,
}

class MyGridChart extends StatelessWidget {
  final Student student;
  final MaterialColor color;
  final ChartType type;
  const MyGridChart({
    Key? key,
    required this.student,
    required this.color,
    required this.type,
  }) : super(key: key);

  Widget showStatus(int index) {
    if (type == ChartType.rollCall) {
      final rc = student.presenceStatus[index];
      return Card(
        color: rc.status ? color : null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              rc.status ? Icons.done : Icons.close,
              size: 10,
            ),
            Text(
              DateFormat.MMMd().format(rc.date),
              style: const TextStyle(fontSize: 7),
            ),
          ],
        ),
      );
    } else {
      final tu = student.paymentsStatus[index];
      final stat = tu.paymentAmount / tu.requiredAmount * 100;
      return Card(
        color: colorSelector(stat),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (stat == 100)
              const Icon(
                Icons.done,
                size: 10,
              ),
            if (stat < 100)
              Text(
                '${stat.toInt()}%',
                style: const TextStyle(fontSize: 7),
              ),
            Text(
              DateFormat.MMM().format(tu.date),
              style: const TextStyle(fontSize: 7),
            ),
          ],
        ),
      );
    }
  }

  Color? colorSelector(double stat) {
    if (stat == 100) {
      return color;
    } else if (70 <= stat && stat < 100) {
      return color.shade300;
    } else if (30 <= stat && stat < 70) {
      return color.shade100;
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    if ((type == ChartType.rollCall && student.presenceStatus.isEmpty) ||
        (type == ChartType.tuition && student.paymentsStatus.isEmpty)) {
      return const Center(
        child: Text('has no data yet!'),
      );
    }
    student.sortRollCalls();
    student.sortPayments();
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 40,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
      scrollDirection: Axis.horizontal,
      itemCount: type == ChartType.rollCall
          ? student.presenceStatus.length
          : student.paymentsStatus.length,
      reverse: true,
      itemBuilder: (context, index) {
        return showStatus(index);
      },
    );
  }
}
