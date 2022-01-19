import 'package:flutter/material.dart';

import 'menu_item.dart';
import './students/students_screen.dart';
import './overal_widgets/title_bar.dart';
import 'package:hamyar/roll_call/roll_call_screen.dart';
import 'package:hamyar/tuition/tuition_screen.dart';
import 'package:hamyar/general_info/general_info_screen.dart';
import 'package:hamyar/notes/notes_screen.dart';
import 'package:hamyar/groups/groups_screen.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              TitleBar(
                title: 'Hamyar',
                hasBackOption: false,
                buttons: {
                  Icons.dark_mode: () {},
                  Icons.menu: () {},
                  Icons.add: () {},
                  Icons.delete: () {},
                },
              ),
              const Expanded(
                child: MenuItems(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuItems extends StatelessWidget {
  const MenuItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(
        horizontal: 8,
        vertical: MediaQuery.of(context).size.height * 0.05,
      ),
      children: [
        Row(
          children: const [
            Expanded(
              child: MenuItem(
                color: Colors.orange,
                title: 'Students',
                icon: Icons.person,
                route: StudentsScreen.routeName,
              ),
            ),
            Expanded(
              child: MenuItem(
                color: Colors.purple,
                title: 'Roll call',
                icon: Icons.assignment_turned_in,
                route: RollCallScreen.routeName,
              ),
            ),
          ],
        ),
        Row(
          children: const [
            Expanded(
              child: MenuItem(
                color: Colors.red,
                title: 'Tuition',
                icon: Icons.monetization_on,
                route: TuitionScreen.routeName,
              ),
            ),
            Expanded(
              child: MenuItem(
                color: Colors.indigo,
                title: 'Notes',
                icon: Icons.sticky_note_2,
                route: NotesScreen.routeName,
              ),
            ),
          ],
        ),
        const MenuItem(
          color: Colors.green,
          title: 'General info',
          icon: Icons.insert_chart,
          route: GeneralInfoScreen.routeName,
        ),
        const MenuItem(
          color: Colors.brown,
          title: 'Groups',
          icon: Icons.groups,
          route: GroupsScreen.routeName,
        ),
      ],
    );
  }
}
