import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:hamyar/overal_widgets/contact_buttons.dart';
import 'package:hamyar/students/student_details_screen.dart';
import 'package:hamyar/models/student.dart';

class StudentCard extends StatelessWidget {
  const StudentCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final student = Provider.of<Student>(context);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      shadowColor: Theme.of(context).colorScheme.primary,
      elevation: 5,
      margin: const EdgeInsets.all(8.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const CircleAvatar(
              radius: 40,
              child: Icon(
                Icons.account_circle,
                size: 80,
              ),
            ),
            Text(student.name),
            const ContactButtons(),
          ],
        ),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) => StudentDetailsScreen(
              // todo: dynamic theming is faulty
              color: Colors.orange,
              student: student,
            ),
          ),
        ),
      ),
    );
  }
}
