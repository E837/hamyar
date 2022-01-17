import 'package:flutter/material.dart';

import 'package:hamyar/tuition/tuition_card.dart';

class TuitionGrid extends StatelessWidget {
  const TuitionGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 250,
        mainAxisSpacing: 5,
        crossAxisSpacing: 3,
        childAspectRatio: 4 / 3,
      ),
      itemBuilder: (context, index) => const TuitionCard(),
      itemCount: 21,
    );
  }
}
