import 'package:flutter/material.dart';

class RollCallItem extends StatefulWidget {
  const RollCallItem({Key? key}) : super(key: key);

  @override
  State<RollCallItem> createState() => _RollCallItemState();
}

class _RollCallItemState extends State<RollCallItem> {
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: checked ? Colors.lightGreenAccent : null,
      shadowColor: Theme.of(context).colorScheme.primary,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              checked ? Icons.file_download_done : Icons.account_circle,
              size: 40,
              color: checked
                  ? Colors.green
                  : Theme.of(context).colorScheme.primary,
            ),
            const Text(
              'Student\'s name',
              textAlign: TextAlign.center,
            ),
          ],
        ),
        onTap: () {
          setState(() {
            checked = !checked;
          });
        },
      ),
    );
  }
}
