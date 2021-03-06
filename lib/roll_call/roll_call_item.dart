import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:hamyar/models/student.dart';
import 'package:hamyar/models/roll_call.dart';
import 'package:hamyar/models/students.dart';

class RollCallItem extends StatefulWidget {
  const RollCallItem({Key? key}) : super(key: key);

  @override
  State<RollCallItem> createState() => _RollCallItemState();
}

class _RollCallItemState extends State<RollCallItem> {
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    final desiredDate =
        Provider.of<Students>(context, listen: false).desiredDateForRollCall;
    final student = Provider.of<Student>(context);
    if (student.presenceStatus.isNotEmpty) {
      final index = student.findRollCallByDate(desiredDate);
      if (index >= 0) {
        checked = student.presenceStatus[index].status;
      }
    }
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: checked ? Colors.lightGreenAccent : null,
      shadowColor: Theme.of(context).colorScheme.primary,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                checked ? Icons.file_download_done : Icons.account_circle,
                size: 35,
                color: checked
                    ? Colors.green
                    : Theme.of(context).colorScheme.primary,
              ),
              AutoSizeText(
                student.name,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ],
          ),
        ),
        onTap: () {
          setState(() {
            checked = !checked;
            student.setRollCall(
              RollCall(
                date: desiredDate,
                status: checked,
              ),
            );
          });
        },
      ),
    );
  }
}
