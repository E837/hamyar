import 'package:flutter/material.dart';

import 'package:hamyar/overal_widgets/title_bar.dart';
import 'package:hamyar/notes/notes_list.dart';

class NotesScreen extends StatelessWidget {
  static const routeName = '/notes-screen';
  const NotesScreen({Key? key}) : super(key: key);

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
                    Icons.settings: () {},
                    Icons.crop: () {},
                    Icons.person: () {},
                  },
                ),
                const SizedBox(height: 20),
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: NotesList(),
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            // todo: make this button invisible on scrolling down
            child: const Icon(Icons.add),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
