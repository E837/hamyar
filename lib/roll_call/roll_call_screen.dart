import 'package:flutter/material.dart';

import 'package:hamyar/roll_call/roll_call_grid.dart';
import 'package:hamyar/overal_widgets/title_bar.dart';

class RollCallScreen extends StatelessWidget {
  static const routeName = '/roll-call-screen';

  const RollCallScreen({Key? key}) : super(key: key);

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
                    Icons.today: () {},
                    Icons.restart_alt: () {},
                    Icons.done_all: () {},
                  },
                ),
                const SizedBox(height: 20),
                Text(
                  'Date: Today',
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
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.done_outline),
          ),
        ),
      ),
    );
  }
}
