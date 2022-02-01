import 'package:flutter/material.dart';

import 'package:hamyar/models/note.dart';
import 'package:hamyar/temp_data.dart';

class Notes with ChangeNotifier {
  List<Note> notes = notesList;

  void removeIfEmpty(BuildContext context) {
    final index = notes
        .indexWhere((note) => (note.title.isEmpty && note.content.isEmpty));
    if (index >= 0) {
      notes.removeAt(index);
      notifyListeners();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Empty note discarded',
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
  }

  void remove(BuildContext context, Note note) {
    // creating a copy of the note
    final index = notes.indexWhere(
        (element) => element.modificationDate == note.modificationDate);
    final noteCopy = Note(
      title: note.title,
      content: note.content,
      modificationDate: note.modificationDate,
    );
    // removing the note
    notes.removeWhere(
        (element) => element.modificationDate == note.modificationDate);
    notifyListeners();
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text(
          'Note deleted successfully',
          textAlign: TextAlign.center,
        ),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            notes.insert(index, noteCopy);
            notifyListeners();
          },
          textColor: Theme.of(context).errorColor,
        ),
      ),
    );
  }

  void addNote() {
    notes.add(Note(title: '', content: ''));
    notifyListeners();
  }
}
