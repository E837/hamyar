import 'package:flutter/material.dart';

class TuitionCard extends StatefulWidget {
  const TuitionCard({Key? key}) : super(key: key);

  @override
  State<TuitionCard> createState() => _TuitionCardState();
}

class _TuitionCardState extends State<TuitionCard> {
  final TextEditingController controller = TextEditingController();

  Widget showMultiplierButton(
      BuildContext context, String text, double height, double width,
      {bool isButton = true}) {
    return GestureDetector(
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius:
              isButton ? BorderRadius.circular(30) : BorderRadius.circular(5),
          color: Theme.of(context).colorScheme.primary,
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            color: Theme.of(context).canvasColor,
          ),
        ),
      ),
      onTap: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
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
                  const Expanded(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text('Student\'s name'),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  showMultiplierButton(
                    context,
                    '3x',
                    constraints.maxHeight * 0.2,
                    constraints.maxHeight * 0.2,
                  ),
                  showMultiplierButton(
                    context,
                    '1x',
                    constraints.maxHeight * 0.2,
                    constraints.maxHeight * 0.2,
                  ),
                  showMultiplierButton(
                    context,
                    '65 \$',
                    constraints.maxHeight * 0.2,
                    constraints.maxWidth * 0.4,
                    isButton: false,
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
                  hintText: 'Sum appears here',
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
