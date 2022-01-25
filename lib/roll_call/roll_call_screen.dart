import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import 'package:hamyar/roll_call/roll_call_grid.dart';
import 'package:hamyar/overal_widgets/title_bar.dart';
import 'package:hamyar/models/students.dart';
import 'package:hamyar/models/date.dart';

class RollCallScreen extends StatefulWidget {
  static const routeName = '/roll-call-screen';

  const RollCallScreen({Key? key}) : super(key: key);

  @override
  State<RollCallScreen> createState() => _RollCallScreenState();
}

class _RollCallScreenState extends State<RollCallScreen> {
  Students? studentsData;
  DateTime desiredDate = Date.now();

  @override
  void dispose() {
    studentsData?.removeIfAllAbsent(desiredDate);
    studentsData?.resetDesiredDate();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    studentsData = Provider.of<Students>(context);
    studentsData?.initializeRollCall(desiredDate);
    final data =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final MaterialColor? color = data['color'];
    final String title = data['title'];
    return Theme(
      data: ThemeData(
        primarySwatch: color,
      ),
      child: Builder(
        builder: (context) => Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                TitleBar(
                  title: title,
                  hasBackOption: true,
                  buttons: {
                    Icons.today: () {
                      showDatePicker(
                        context: context,
                        initialDate: desiredDate,
                        firstDate: DateTime(2021),
                        lastDate: Date.now(),
                      ).then((pickedDate) {
                        setState(() {
                          if (pickedDate != null) {
                            studentsData?.removeIfAllAbsent(desiredDate);
                          }
                          desiredDate = pickedDate ?? desiredDate;
                          studentsData?.desiredDateForRollCall = desiredDate;
                        });
                      });
                    },
                    Icons.restart_alt: () {
                      studentsData?.resetRollCall(desiredDate);
                    },
                    Icons.done_all: () {
                      studentsData?.checkAllRollCall(desiredDate);
                    },
                  },
                ),
                const SizedBox(height: 20),
                Text(
                  'Date: ${desiredDate == Date.now() ? 'Today' : DateFormat.yMMMd().format(desiredDate)}',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primaryVariant,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 20),
                const Expanded(child: RollCallGrid()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
