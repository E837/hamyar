import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:hamyar/temp_data.dart';

class GroupDetailsScreen extends StatelessWidget {
  final Color color;
  const GroupDetailsScreen({
    Key? key,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final materialColor = MaterialColor(color.value, const {
      50: Color.fromRGBO(121, 85, 72, 0.1),
      100: Color.fromRGBO(121, 85, 72, .2),
      200: Color.fromRGBO(121, 85, 72, .3),
      300: Color.fromRGBO(121, 85, 72, .4),
      400: Color.fromRGBO(121, 85, 72, .5),
      500: Color.fromRGBO(121, 85, 72, .6),
      600: Color.fromRGBO(121, 85, 72, .7),
      700: Color.fromRGBO(121, 85, 72, .8),
      800: Color.fromRGBO(121, 85, 72, .9),
      900: Color.fromRGBO(121, 85, 72, 1),
    });
    // final deviceSize = MediaQuery.of(context).size;
    String listTheNames() {
      String memberNames = '';
      for (var student in students) {
        memberNames += '$student / ';
      }
      return memberNames.substring(0, memberNames.length - 3);
    }

    return Theme(
      data: ThemeData(
        primarySwatch: materialColor,
      ),
      child: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: const Text('Group\'s name'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Text(
                  'Group members:\n',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  listTheNames(),
                  textAlign: TextAlign.center,
                ),
                const Divider(),
                ElevatedButton(
                  onPressed: () {},
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text('Roll call'),
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                const Divider(),
                Expanded(
                  child: ListView.builder(
                    itemCount: 8,
                    itemBuilder: (ctx, index) => Card(
                      child: InkWell(
                        child: const ListTile(
                          leading: Text('10/05/22'),
                          trailing: Text('Presence: 5'),
                        ),
                        onTap: () {},
                      ),
                    ),
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
