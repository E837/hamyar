import 'package:flutter/material.dart';

import 'package:hamyar/overal_widgets/title_bar.dart';

class GeneralInfoScreen extends StatelessWidget {
  static const routeName = '/general-info-screen';
  const GeneralInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final MaterialColor? color = data['color'];
    final String title = data['title'];
    final deviceSize = MediaQuery.of(context).size;
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
                    Icons.settings: () {},
                    Icons.crop: () {},
                    Icons.person: () {},
                  },
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: deviceSize.height * 0.2,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.primary,
                                borderRadius: const BorderRadius.only(
                                  bottomRight: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                              ),
                              alignment: Alignment.center,
                              child: RotatedBox(
                                quarterTurns: 1,
                                child: Text(
                                  'THIS MONTH',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Theme.of(context).canvasColor,
                                    letterSpacing: 2,
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                CircleAvatar(
                                  radius: deviceSize.height * 0.08,
                                  child: Text('chart'),
                                ),
                                const SizedBox(height: 10),
                                const Text('Presence'),
                              ],
                            ),
                            Column(
                              children: [
                                CircleAvatar(
                                  radius: deviceSize.height * 0.08,
                                  child: Text('chart'),
                                ),
                                const SizedBox(height: 10),
                                const Text('Payments'),
                              ],
                            ),
                            SizedBox(width: deviceSize.width * 0.02),
                          ],
                        ),
                        const Divider(
                          indent: 30,
                          endIndent: 30,
                        ),
                        Row(
                          children: [
                            Container(
                              height: deviceSize.height * 0.35,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.primary,
                                borderRadius: const BorderRadius.only(
                                  bottomRight: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                              ),
                              alignment: Alignment.center,
                              child: RotatedBox(
                                quarterTurns: 1,
                                child: Text(
                                  'LAST 12 MONTHS',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Theme.of(context).canvasColor,
                                    letterSpacing: 2,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                height: deviceSize.height * 0.35,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.primary,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      'presence chart',
                                      style: TextStyle(
                                        color: Theme.of(context).canvasColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'payments chart',
                                      style: TextStyle(
                                        color: Theme.of(context).canvasColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
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
