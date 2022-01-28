import 'package:flutter/material.dart';

import 'package:hamyar/models/student.dart';
import 'package:hamyar/overal_widgets/contact_buttons.dart';
import 'package:hamyar/models/phone_number.dart';

class StudentDetailsScreen extends StatelessWidget {
  final MaterialColor color;
  final Student student;

  const StudentDetailsScreen({
    Key? key,
    required this.color,
    required this.student,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Theme(
      data: ThemeData(
        primarySwatch: color,
      ),
      child: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: Text(student.name),
          ),
          body: ListView(
            children: [
              Padding(
                padding: EdgeInsets.all(deviceSize.height * 0.03),
                child: CircleAvatar(
                  radius: 60,
                  child: Icon(
                    Icons.account_circle,
                    size: 120,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  // todo: set a button here to add image from gallery or camera
                ),
              ),
              Text(
                student.joinDate.toString(),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: deviceSize.height * 0.02),
              Column(
                children: const [
                  Text('last presence: 4th of January'),
                  Text('last payment: 1st of December'),
                ],
              ),
              const SizedBox(height: 10),
              Column(
                children: [
                  for (var phoneNumber in student.phone)
                    Text(
                        '${PhoneNumber.typeToString(phoneNumber.type)} : ${phoneNumber.number}')
                ],
              ),
              Container(
                margin:
                    EdgeInsets.symmetric(vertical: deviceSize.height * 0.03),
                width: double.infinity,
                height: 50,
                color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Expanded(
                      child: ContactButtons(),
                      flex: 3,
                    ),
                    SizedBox(width: 20),
                    Text('|'),
                    SizedBox(width: 20),
                    Expanded(
                      child: Text(
                        'contact!',
                        textAlign: TextAlign.center,
                      ),
                      flex: 2,
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 150,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(child: Text('roll call chart')),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    height: 150,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(child: Text('tuition chart')),
                  ),
                ],
              ),
              SizedBox(height: deviceSize.height * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}
