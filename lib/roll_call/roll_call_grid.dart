import 'package:flutter/material.dart';

import 'roll_call_item.dart';

class RollCallGrid extends StatelessWidget {
  const RollCallGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 100,
        childAspectRatio: 1,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) => const RollCallItem(),
      itemCount: 32,
      padding: const EdgeInsets.symmetric(horizontal: 8),
    );
  }
}
