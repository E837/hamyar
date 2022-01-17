import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:hamyar/notes/note_item.dart';

class NotesList extends StatelessWidget {
  const NotesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.builder(
      gridDelegate: const SliverSimpleGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 480,
      ),
      mainAxisSpacing: 5,
      crossAxisSpacing: 3,
      itemBuilder: (context, index) => const NoteItem(),
      itemCount: 8,
    );
  }
}
