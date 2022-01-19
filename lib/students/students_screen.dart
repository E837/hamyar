import 'package:flutter/material.dart';

import 'students_grid.dart';
import '../overal_widgets/title_bar.dart';

class StudentsScreen extends StatelessWidget {
  static const routeName = '/students-screen';

  const StudentsScreen({Key? key}) : super(key: key);

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
                    Icons.add: () {},
                    Icons.highlight_off: () {},
                  },
                ),
                const SizedBox(height: 20),
                const Expanded(child: StudentsGrid()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
