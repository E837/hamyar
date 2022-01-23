import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:hamyar/models/student.dart';

class TuitionCard extends StatefulWidget {
  const TuitionCard({Key? key}) : super(key: key);

  @override
  State<TuitionCard> createState() => _TuitionCardState();
}

class _TuitionCardState extends State<TuitionCard> {
  final TextEditingController controller = TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    final student = Provider.of<Student>(context, listen: false);
    return Card(
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
                      student.name,
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
                    function: () {},
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
                    function: () {},
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
