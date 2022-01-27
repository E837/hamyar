import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:hamyar/overal_widgets/title_bar.dart';
import 'package:hamyar/notes/notes_grid.dart';
import 'package:hamyar/models/notes.dart';
import 'package:hamyar/notes/note_fields.dart';

class NotesScreen extends StatefulWidget {
  static const routeName = '/notes-screen';
  const NotesScreen({Key? key}) : super(key: key);

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  bool _isReverted = true;

  @override
  Widget build(BuildContext context) {
    final notesData = Provider.of<Notes>(context, listen: false);
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
                    Icons.add: () {
                      notesData.addNote();
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(40),
                          ),
                        ),
                        builder: (ctx) => NoteFields(
                          note: notesData.notes.last,
                        ),
                      ).then((value) => notesData.removeIfEmpty(context));
                    },
                    Icons.low_priority: () {
                      setState(() {
                        _isReverted = !_isReverted;
                      });
                    },
                  },
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: NotesGrid(isReverted: _isReverted),
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
