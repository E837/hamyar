import 'package:flutter/material.dart';
import 'package:hamyar/notes/note_fields.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import 'package:hamyar/models/note.dart';
import 'package:hamyar/models/notes.dart';

class NoteItem extends StatefulWidget {
  const NoteItem({Key? key}) : super(key: key);

  @override
  State<NoteItem> createState() => _NoteItemState();
}

class _NoteItemState extends State<NoteItem> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  @override
  void initState() {
    final note = Provider.of<Note>(context, listen: false);
    titleController.text = note.title;
    contentController.text = note.content;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final notesData = Provider.of<Notes>(context);
    final note = Provider.of<Note>(context);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      shadowColor: Theme.of(context).colorScheme.primary,
      elevation: 2,
      child: LayoutBuilder(
        builder: (context, constraints) => InkWell(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.description,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            note.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Text(DateFormat.yMMMd().format(note.modificationDate)),
                      ],
                    ),
                    Divider(
                      endIndent: constraints.maxWidth * 0.6,
                    ),
                    Text(
                      note.content,
                      overflow: TextOverflow.fade,
                      maxLines: 6,
                    ),
                  ],
                ),
              ),
              GestureDetector(
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      topLeft: Radius.circular(10),
                    ),
                  ),
                  child: Icon(
                    Icons.delete_outline,
                    color: Theme.of(context).canvasColor,
                  ),
                ),
                onTap: () {
                  notesData.remove(context, note);
                },
              ),
            ],
          ),
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(40),
                ),
              ),
              builder: (ctx) => NoteFields(
                note: note,
              ),
            ).then((value) => notesData.removeIfEmpty(context));
          },
        ),
      ),
    );
  }
}
