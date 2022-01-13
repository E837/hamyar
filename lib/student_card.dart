import 'package:flutter/material.dart';
import 'package:hamyar/contact_buttons.dart';
import 'package:hamyar/student_screen.dart';

class Student extends StatelessWidget {
  const Student({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            child: const CircleAvatar(
              radius: 40,
              child: Icon(
                Icons.account_circle,
                size: 80,
              ),
            ),
            onTap: () => push(context),
          ),
          GestureDetector(
            child: const Text('student\'s name'),
            onTap: () => push(context),
          ),
          const ContactButtons(),
        ],
      ),
    );
  }

  void push(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => const StudentScreen(),
      ),
    );
  }
}
