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
  final controller = TextEditingController();

  @override
  void dispose() {
    studentsData?.removeIfAllNotPaid(desiredMonth);
    studentsData?.resetDesiredMonth();
    super.dispose();
  }

  bool _isEditingRequiredAmount = false;

  @override
  Widget build(BuildContext context) {
    studentsData = Provider.of<Students>(context);
    studentsData?.initializeTuition(desiredMonth, _isEditingRequiredAmount);
    _isEditingRequiredAmount = false;
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
                        // using old date
                        if (pickedMonth != null) {
                          studentsData?.removeIfAllNotPaid(desiredMonth);
                        }
                        // updating the date
                        desiredMonth = pickedMonth ?? desiredMonth;
                        studentsData?.setDesiredMonth(desiredMonth);
                      });
                    },
                    Icons.settings: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(40),
                            topLeft: Radius.circular(40),
                          ),
                        ),
                        builder: (ctx) => Padding(
                          padding: EdgeInsets.only(
                            top: 26.0,
                            right: 16.0,
                            left: 16.0,
                            bottom: MediaQuery.of(ctx).viewInsets.bottom + 16,
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text(
                                    'Specify the tuition amount for this month'),
                                const SizedBox(height: 10),
                                SizedBox(
                                  width: 140,
                                  child: TextField(
                                    controller: controller,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      labelText: 'Amount',
                                      hintText: 'numbers only',
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary
                                              .withOpacity(0.4),
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 8),
                                    ),
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                                const SizedBox(height: 10),
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
                                        _isEditingRequiredAmount = true;
                                        studentsData?.requiredAmount =
                                            double.tryParse(controller.text) ??
                                                0;
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Confirm'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
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
