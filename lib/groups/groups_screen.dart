import 'package:flutter/material.dart';

import '../overal_widgets/title_bar.dart';
import 'package:hamyar/groups/groups_grid.dart';

class GroupsScreen extends StatelessWidget {
  static const routeName = '/groups-screen';

  const GroupsScreen({Key? key}) : super(key: key);

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
                  child: GroupsGrid(),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
