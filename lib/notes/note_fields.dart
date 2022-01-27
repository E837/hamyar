import 'package:flutter/material.dart';

import 'package:hamyar/models/note.dart';

class NoteFields extends StatefulWidget {
  final Note note;

  const NoteFields({
    Key? key,
    required this.note,
  }) : super(key: key);

  @override
  State<NoteFields> createState() => _NoteFieldsState();
}

class _NoteFieldsState extends State<NoteFields> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  @override
  void initState() {
    titleController.text = widget.note.title;
    contentController.text = widget.note.content;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          top: 35.0,
          right: 16.0,
          left: 16.0,
          bottom: MediaQuery.of(context).viewInsets.bottom + 35,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.sentences,
              onChanged: (value) {
                widget.note.title = value;
              },
            ),
            const SizedBox(height: 10),
            TextField(
              controller: contentController,
              decoration: InputDecoration(
                labelText: 'Content',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.newline,
              maxLines: null,
              onChanged: (value) {
                widget.note.content = value.trim();
              },
            ),
          ],
        ),
      ),
    );
  }
}
