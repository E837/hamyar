import 'package:flutter/material.dart';

import 'package:hamyar/models/phone_number.dart';

class PhoneNumberField extends StatefulWidget {
  final List<TextEditingController> controllers;
  final List<PhoneType> phoneTypes;

  const PhoneNumberField({
    Key? key,
    required this.controllers,
    required this.phoneTypes,
  }) : super(key: key);

  @override
  State<PhoneNumberField> createState() => _PhoneNumberFieldState();
}

class _PhoneNumberFieldState extends State<PhoneNumberField> {
  int _count = 0;

  DropdownMenuItem<PhoneType> generateDropDownItem(PhoneType type) {
    return DropdownMenuItem(
      value: type,
      child: Text(PhoneNumber.typeToString(type)),
    );
  }

  @override
  void initState() {
    widget.controllers.add(TextEditingController());
    widget.phoneTypes.add(PhoneType.main);
    _count++;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: _count,
      itemBuilder: (context, index) {
        return Row(
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
                  value: widget.phoneTypes[index],
                  items: PhoneNumber.phoneTypeItems(includeMain: index == 0)
                      .map(generateDropDownItem)
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      widget.phoneTypes[index] =
                          value ?? widget.phoneTypes[index];
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
                  widget.phoneTypes.add(PhoneType.mobile);
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
                        widget.phoneTypes.removeAt(index);
                      });
                    }
                  : null,
              icon: const Icon(Icons.remove_circle_outline),
            ),
          ],
        );
      },
    );
  }
}
