import 'package:flutter/material.dart';
import 'package:hamyar/groups/group_card.dart';

class GroupsGrid extends StatelessWidget {
  const GroupsGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3,
      ),
      itemCount: 6,
      itemBuilder: (context, index) => const GroupCard(),
    );
  }
}
