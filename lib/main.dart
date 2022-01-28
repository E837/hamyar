import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:hamyar/main_menu.dart';
import 'package:hamyar/notes/notes_screen.dart';
import 'package:hamyar/roll_call/roll_call_screen.dart';
import 'package:hamyar/students/students_screen.dart';
import 'package:hamyar/tuition/tuition_screen.dart';
import 'package:hamyar/general_info/general_info_screen.dart';
import 'package:hamyar/groups/groups_screen.dart';
import 'package:hamyar/models/notes.dart';
import 'package:hamyar/models/students.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Students()),
        ChangeNotifierProvider(create: (_) => Notes()),
      ],
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Hamyar',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          // brightness: Brightness.dark,
        ),
        home: const MainMenu(),
        routes: {
          StudentsScreen.routeName: (ctx) => StudentsScreen(),
          RollCallScreen.routeName: (ctx) => const RollCallScreen(),
          TuitionScreen.routeName: (ctx) => const TuitionScreen(),
          NotesScreen.routeName: (ctx) => const NotesScreen(),
          GeneralInfoScreen.routeName: (ctx) => const GeneralInfoScreen(),
          GroupsScreen.routeName: (ctx) => const GroupsScreen(),
        },
      ),
    );
  }
}
