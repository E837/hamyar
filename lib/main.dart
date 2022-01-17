import 'package:flutter/material.dart';

import 'package:hamyar/main_menu.dart';
import 'package:hamyar/roll_call/roll_call_screen.dart';
import 'package:hamyar/students/students_screen.dart';
import 'package:hamyar/tuition/tuition_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hamyar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // brightness: Brightness.dark,
      ),
      home: const MainMenu(),
      routes: {
        StudentsScreen.routeName: (ctx) => const StudentsScreen(),
        RollCallScreen.routeName: (ctx) => const RollCallScreen(),
        TuitionScreen.routeName: (ctx) => const TuitionScreen(),
      },
    );
  }
}
