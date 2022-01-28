import 'package:flutter/material.dart';

import 'students_grid.dart';
import '../overal_widgets/title_bar.dart';
import 'package:hamyar/students/student_fields.dart';

class StudentsScreen extends StatelessWidget {
  static const routeName = '/students-screen';
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  StudentsScreen({Key? key}) : super(key: key);

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
          key: _key,
          body: SafeArea(
            child: Column(
              children: [
                TitleBar(
                  title: title,
                  hasBackOption: true,
                  buttons: {
                    Icons.person_add: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(40),
                          ),
                        ),
                        builder: (ctx) => const StudentFields(),
                      );
                    },
                    Icons.reduce_capacity: () {
                      _key.currentState!.openEndDrawer();
                    },
                  },
                ),
                const SizedBox(height: 20),
                const Expanded(child: StudentsGrid()),
              ],
            ),
          ),
          endDrawer: Drawer(
            child: ListView(
              children: [
                SafeArea(
                    child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14.0,
                      vertical: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Manage\n    Students',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                        Divider(),
                      ],
                    ),
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
