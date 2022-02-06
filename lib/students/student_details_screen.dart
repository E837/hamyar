import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:hamyar/models/student.dart';
import 'package:hamyar/overal_widgets/contact_buttons.dart';
import 'package:hamyar/models/phone_number.dart';
import 'package:hamyar/students/my_grid_chart.dart';

class StudentDetailsScreen extends StatelessWidget {
  final MaterialColor color;
  final Student student;

  const StudentDetailsScreen({
    Key? key,
    required this.color,
    required this.student,
  }) : super(key: key);

  String get lastPresence {
    return student.presenceStatus.isNotEmpty
        ? DateFormat.yMEd().format(student.presenceStatus.last.date)
        : 'has no data yet!';
  }

  String get lastPayment {
    if (student.paymentsStatus.isNotEmpty) {
      return student.paymentsStatus.last.paymentAmount.toString() +
          '\$, on: ' +
          DateFormat.MMMM().format(student.paymentsStatus.last.date);
    } else {
      return 'has no data yet!';
    }
  }

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
            actions: [
              PopupMenuButton(
                icon: const Icon(Icons.more_vert),
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    child: Text('reset student\'s data'),
                    value: 1,
                  ),
                  const PopupMenuItem(
                    child: Text('remove this student'),
                    value: 2,
                  ),
                ],
                onSelected: (selectedValue) {
                  if (selectedValue == 1) {
                    // todo: reset student
                  } else if (selectedValue == 2) {
                    // todo: remove student
                  }
                },
              ),
            ],
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
                'since: ' + DateFormat.yMMMd().format(student.joinDate),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: deviceSize.height * 0.02),
              Column(
                children: [
                  Text('last presence: $lastPresence'),
                  Text('last payment: $lastPayment'),
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
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: MyGridChart(
                      student: student,
                      color: color,
                      type: ChartType.rollCall,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    height: 150,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: MyGridChart(
                      student: student,
                      color: color,
                      type: ChartType.tuition,
                    ),
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
