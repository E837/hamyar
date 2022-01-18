import 'package:flutter/material.dart';
import 'package:hamyar/groups/group_details_screen.dart';

class GroupCard extends StatelessWidget {
  const GroupCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      shadowColor: Theme.of(context).colorScheme.primary,
      elevation: 5,
      margin: const EdgeInsets.all(8.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 5),
          child: Row(
            children: [
              Icon(
                Icons.group,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 8),
              const Expanded(
                child: Text(
                  'Group\'s name',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        onTap: () => push(context),
      ),
    );
  }

  void push(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => GroupDetailsScreen(
          // todo: dynamic theming is faulty
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
