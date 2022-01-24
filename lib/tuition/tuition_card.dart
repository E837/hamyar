import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:hamyar/models/tuition.dart';
import 'package:hamyar/models/student.dart';
import 'package:hamyar/models/students.dart';

class TuitionCard extends StatefulWidget {
  const TuitionCard({Key? key}) : super(key: key);

  @override
  State<TuitionCard> createState() => _TuitionCardState();
}

class _TuitionCardState extends State<TuitionCard> {
  final TextEditingController controller = TextEditingController();
  Students? studentsData;
  Student? student;
  Color? cardColor;

  Widget showMultiplierButton(
      BuildContext context, Widget widget, double height, double width,
      {VoidCallback? function}) {
    return GestureDetector(
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: function != null
              ? BorderRadius.circular(30)
              : BorderRadius.circular(5),
          color: Theme.of(context).colorScheme.primary,
        ),
        alignment: Alignment.center,
        child: widget,
      ),
      onTap: function,
    );
  }

  void textListener() {
    // writing data on the provider
    final paymentAmount = double.tryParse(controller.text) ?? 0;
    student?.setPayment(Tuition(
      date: studentsData!.desiredMonthForPayment,
      paymentAmount: paymentAmount,
      requiredAmount: 65,
    ));
    for (var payment in student!.paymentsStatus) {
      print('date: ${payment.date}, amount: ${payment.paymentAmount}');
    }
    // changing the card color
    if (paymentAmount > 0) {
      //todo: dynamic theming should be implemented there
      setState(() {
        cardColor = Colors.red.shade100;
      });
    } else {
      setState(() {
        cardColor = Theme.of(context).cardColor;
      });
    }
    // avoiding non-numeric input
    if (double.tryParse(controller.text) == null && controller.text != '') {
      controller.text =
          controller.text.substring(0, controller.text.length - 1);
      // moving the cursor to the end of the line
      // so user can continue typing without any issues
      controller.selection = TextSelection.fromPosition(
          TextPosition(offset: controller.text.length));
    }
  }

  @override
  void initState() {
    print('card init');
    controller.addListener(textListener);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    studentsData = Provider.of<Students>(context);
    student = Provider.of<Student>(context, listen: false);
    final initialAmount =
        student!.getPaymentData(studentsData!.desiredMonthForPayment);
    controller.text = initialAmount == 0 ? '' : initialAmount.toString();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    controller.removeListener(textListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('card build');
    print('------------');
    return Card(
      color: cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      shadowColor: Theme.of(context).colorScheme.primary,
      child: LayoutBuilder(
        builder: (context, constraints) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.account_circle,
                    size: 30,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  Text(
                    '  |  ',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  Expanded(
                    child: AutoSizeText(
                      student!.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  showMultiplierButton(
                    context,
                    Icon(
                      Icons.restart_alt,
                      color: Theme.of(context).cardColor,
                      size: 18,
                    ),
                    constraints.maxHeight * 0.2,
                    constraints.maxHeight * 0.2,
                    function: () {
                      controller.text = '';
                    },
                  ),
                  showMultiplierButton(
                    context,
                    Icon(
                      Icons.done_all,
                      color: Theme.of(context).cardColor,
                      size: 18,
                    ),
                    constraints.maxHeight * 0.2,
                    constraints.maxHeight * 0.2,
                    function: () {
                      controller.text = '65';
                    },
                  ),
                  showMultiplierButton(
                    context,
                    Text(
                      '65 \$',
                      style: TextStyle(
                        color: Theme.of(context).cardColor,
                      ),
                    ),
                    constraints.maxHeight * 0.2,
                    constraints.maxWidth * 0.4,
                  ),
                ],
              ),
              TextField(
                controller: controller,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.4),
                    ),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                  ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                    gapPadding: 0,
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                  hintText: 'You can type here',
                  hintStyle: const TextStyle(
                    fontSize: 12,
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
