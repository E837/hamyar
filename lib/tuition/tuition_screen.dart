import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:hamyar/overal_widgets/title_bar.dart';
import 'package:hamyar/tuition/tuition_grid.dart';
import 'package:hamyar/models/date.dart';

class TuitionScreen extends StatefulWidget {
  static const routeName = '/tuition';
  const TuitionScreen({Key? key}) : super(key: key);

  @override
  State<TuitionScreen> createState() => _TuitionScreenState();
}

class _TuitionScreenState extends State<TuitionScreen> {
  DateTime desiredMonth = Date.currentMonth();

  @override
  Widget build(BuildContext context) {
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
                        initialDate: desiredMonth,
                        firstDate: DateTime(2018),
                        lastDate: Date.currentMonth(),
                      ).then((pickedMonth) {
                        setState(() {
                          desiredMonth = pickedMonth ?? desiredMonth;
                        });
                      });
                    },
                    Icons.settings: () {},
                  },
                ),
                const SizedBox(height: 20),
                Text(
                  'Month: ${DateFormat.yMMMM().format(desiredMonth)}',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 20),
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: TuitionGrid(),
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.done),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (ctx) => Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('Count of students who payed: .....'),
                      const SizedBox(height: 10),
                      const Text('Total sum of payments: ..... \$'),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          OutlinedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('Cancel'),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .popUntil((route) => route.isFirst);
                            },
                            child: const Text('Confirm'),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
