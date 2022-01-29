import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiver/iterables.dart';

import 'package:hamyar/models/student.dart';
import 'package:hamyar/models/students.dart';
import 'package:hamyar/models/phone_number.dart';
import 'phone_number_field.dart';

class StudentFields extends StatefulWidget {
  const StudentFields({Key? key}) : super(key: key);

  @override
  State<StudentFields> createState() => _StudentFieldsState();
}

class _StudentFieldsState extends State<StudentFields> {
  final nameController = TextEditingController();
  final List<TextEditingController> phoneControllers = [];
  final List<PhoneType> phoneTypes = [];
  bool wannaValidate = false;

  List<PhoneNumber> get phoneNumbers {
    final List<PhoneNumber> result = [];
    for (var pair in zip([phoneTypes, phoneControllers])) {
      result.add(
        PhoneNumber(
            type: pair[0] as PhoneType,
            number: (pair[1] as TextEditingController).text),
      );
    }
    result.removeWhere((element) => element.number == '');
    return result;
  }

  bool failedValidate() {
    return (wannaValidate && nameController.text == '');
  }

  @override
  Widget build(BuildContext context) {
    final studentsData = Provider.of<Students>(context, listen: false);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
          bottom: MediaQuery.of(context).viewInsets.bottom + 20,
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  errorText: failedValidate() ? 'required' : null,
                ),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                textCapitalization: TextCapitalization.words,
              ),
              PhoneNumberField(
                controllers: phoneControllers,
                phoneTypes: phoneTypes,
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  if (!wannaValidate) {
                    setState(() {
                      wannaValidate = true;
                    });
                  }
                  if (!failedValidate()) {
                    studentsData.addStudent(Student(
                      name: nameController.text,
                      phone: phoneNumbers,
                    ));
                    Navigator.of(context).pop();
                  }
                },
                child: const Text('Confirm'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
