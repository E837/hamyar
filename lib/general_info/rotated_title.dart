import 'package:flutter/material.dart';

class RotatedTitle extends StatelessWidget {
  final String title;
  final double height;
  const RotatedTitle({
    Key? key,
    required this.title,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: 40,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      alignment: Alignment.center,
      child: RotatedBox(
        quarterTurns: 1,
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Theme.of(context).canvasColor,
            letterSpacing: 2,
          ),
        ),
      ),
    );
  }
}
