import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

import 'package:hamyar/overal_widgets/title_bar.dart';
import 'package:hamyar/tuition/tuition_grid.dart';
import 'package:hamyar/models/date.dart';
import 'package:hamyar/models/students.dart';

class TuitionScreen extends StatefulWidget {
  static const routeName = '/tuition';
  const TuitionScreen({Key? key}) : super(key: key);

  @override
  State<TuitionScreen> createState() => _TuitionScreenState();
}

class _TuitionScreenState extends State<TuitionScreen> {
  DateTime desiredMonth = Date.currentMonth();
  Students? studentsData;

  @override
  void dispose() {
    studentsData?.resetDesiredMonth();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    studentsData = Provider.of<Students>(context);
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
                      showMonthPicker(
                        context: context,
                        initialDate: desiredMonth,
                        firstDate: DateTime(2018),
                      ).then((pickedMonth) {
                        desiredMonth = pickedMonth ?? desiredMonth;
                        studentsData?.setDesiredMonth(desiredMonth);
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
        ),
      ),
    );
  }
}
