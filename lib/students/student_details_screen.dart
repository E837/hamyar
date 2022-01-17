import 'package:flutter/material.dart';
import 'package:hamyar/overal_widgets/contact_buttons.dart';

class StudentDetailsScreen extends StatelessWidget {
  final MaterialColor color;
  const StudentDetailsScreen({
    Key? key,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primarySwatch: color,
      ),
      child: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: const Text('student\'s details'),
          ),
          body: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  radius: 60,
                  child: Icon(
                    Icons.account_circle,
                    size: 120,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  // todo: set a button here to add image from gallery or camera
                ),
                const Text('student\'s name'),
                Column(
                  children: const [
                    Text('last presence: 4th of January'),
                    Text('last payment: 1st of December'),
                  ],
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Expanded(
                        child: ContactButtons(),
                        flex: 3,
                      ),
                      SizedBox(width: 20),
                      Text('|'),
                      SizedBox(width: 20),
                      Expanded(
                        child: Text(
                          'contact!',
                          textAlign: TextAlign.center,
                        ),
                        flex: 2,
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 150,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(child: Text('roll call chart')),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      height: 150,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(child: Text('tuition chart')),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}