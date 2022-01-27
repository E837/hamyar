import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import 'package:hamyar/notes/note_item.dart';
import 'package:hamyar/models/notes.dart';

class NotesGrid extends StatelessWidget {
  final bool isReverted;

  const NotesGrid({
    Key? key,
    required this.isReverted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final notesData = Provider.of<Notes>(context);
    final notes = Provider.of<Notes>(context).notes;
    return MasonryGridView.builder(
      gridDelegate: const SliverSimpleGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 480,
      ),
      mainAxisSpacing: 5,
      crossAxisSpacing: 3,
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
        value: notes[isReverted ? notes.length - (index + 1) : index],
        child: Dismissible(
          key: ValueKey(notes[index].modificationDate.toString()),
          // modificationDate is "DateTime.now()" and it's identical enough to be used as a key
          child: const NoteItem(),
          onDismissed: (_) {
            notesData.remove(context, notes[index]);
          },
        ),
      ),
      itemCount: notes.length,
    );
  }
}
