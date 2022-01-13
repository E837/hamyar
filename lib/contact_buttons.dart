import 'package:flutter/material.dart';

class ContactButtons extends StatelessWidget {
  const ContactButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          child: const CircleAvatar(
            radius: 12,
            child: Icon(
              Icons.call,
              size: 14,
            ),
          ),
          onTap: () {},
        ),
        GestureDetector(
          child: const CircleAvatar(
            radius: 12,
            child: Icon(
              Icons.chat,
              size: 14,
            ),
          ),
          onTap: () {},
        ),
        GestureDetector(
          child: const CircleAvatar(
            radius: 12,
            child: Icon(
              Icons.send,
              size: 14,
            ),
          ),
          onTap: () {},
        ),
        GestureDetector(
          child: const CircleAvatar(
            radius: 12,
            child: Icon(
              Icons.wifi_calling,
              size: 14,
            ),
          ),
          onTap: () {},
        ),
      ],
    );
  }
}
