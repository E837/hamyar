import 'package:flutter/material.dart';

class TitleBar extends StatelessWidget {
  final String title;
  final bool hasBackOption;
  final Map<IconData, VoidCallback> buttons;

  const TitleBar({
    Key? key,
    required this.title,
    required this.hasBackOption,
    required this.buttons,
  }) : super(key: key);

  Widget showBarItem(BuildContext context, IconData icon,
      {required VoidCallback onTap}) {
    return GestureDetector(
      child: Container(
        height: 40,
        width: 40,
        margin: const EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).colorScheme.primaryVariant,
        ),
        child: Icon(
          icon,
          color: Theme.of(context).canvasColor,
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.04),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    if (hasBackOption)
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0, top: 3),
                        child: showBarItem(
                          context,
                          Icons.arrow_back,
                          onTap: () => Navigator.of(context).pop(),
                        ),
                      ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            title,
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color:
                                  Theme.of(context).colorScheme.primaryVariant,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15),
                  height: 5,
                  width: 180,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    gradient: LinearGradient(
                      colors: [
                        Theme.of(context).colorScheme.primary,
                        Theme.of(context).colorScheme.primary.withOpacity(0),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 50,
            width: buttons.length * 50,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(25),
                topLeft: Radius.circular(25),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var button in buttons.entries)
                  showBarItem(
                    context,
                    button.key,
                    onTap: button.value,
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
