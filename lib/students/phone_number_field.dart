import 'package:flutter/material.dart';

import 'package:hamyar/models/phone_number.dart';

class PhoneNumberField extends StatefulWidget {
  // final Function(List<PhoneType> types, List<String> numbers)
  //     collectPhoneNumbers;
  final List<TextEditingController> controllers;

  const PhoneNumberField({
    Key? key,
    required this.controllers,
  }) : super(key: key);

  @override
  State<PhoneNumberField> createState() => _PhoneNumberFieldState();
}

class _PhoneNumberFieldState extends State<PhoneNumberField> {
  int _count = 0;
  // todo: type selection is not implemented completely (should also specify a "list" of of vars for this - not only one)
  PhoneType dropDownMenuValue = PhoneType.main;

  DropdownMenuItem<PhoneType> dropDownItem(PhoneType type) {
    return DropdownMenuItem(
      value: type,
      child: Text(PhoneNumber.typeToString(type)),
    );
  }

  @override
  void initState() {
    widget.controllers.add(TextEditingController());
    _count++;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: _count,
      itemBuilder: (context, index) => Row(
        children: [
          Expanded(
            child: TextField(
              controller: widget.controllers[index],
              decoration: const InputDecoration(
                labelText: 'Phone Number',
              ),
              keyboardType: TextInputType.number,
              // textInputAction: ,
            ),
          ),
          const SizedBox(width: 15),
          Container(
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 5),
            margin: const EdgeInsets.only(top: 10),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<PhoneType>(
                value: dropDownMenuValue,
                items: PhoneType.values.map(dropDownItem).toList(),
                onChanged: (value) {
                  setState(() {
                    dropDownMenuValue = value ?? dropDownMenuValue;
                  });
                },
              ),
            ),
          ),
          const SizedBox(width: 5),
          IconButton(
            onPressed: () {
              setState(() {
                widget.controllers.add(TextEditingController());
                _count++;
              });
            },
            icon: const Icon(Icons.control_point),
          ),
          IconButton(
            onPressed: _count > 1
                ? () {
                    setState(() {
                      _count--;
                      widget.controllers.removeAt(index);
                    });
                  }
                : null,
            icon: const Icon(Icons.remove_circle_outline),
          ),
        ],
      ),
    );
  }
}
