import 'package:flutter/material.dart';
import 'package:student_assistant_app/utilities/constants.dart';
class Careers extends StatefulWidget {
  const Careers({Key? key}) : super(key: key);

  @override
  State<Careers> createState() => _CareersState();
}

class _CareersState extends State<Careers> {

  String dropdownvalue = 'Item 1';

  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
      Text(
      'Career Interest',
      style: kLabelStyle,
      ),
      SizedBox(height: 10.0),
      Container(
        alignment: Alignment.centerLeft,
        decoration: kBoxDecorationStyle,
        height: 60.0,
        child:  Center(
          child: DropdownButton(

            // Initial Value
            value: dropdownvalue,
            dropdownColor: Colors.blueAccent,
            style: const TextStyle(

            color: Colors.white,
            fontFamily: 'OpenSans'),
            // Down Arrow Icon
            icon: const Icon(
              Icons.keyboard_arrow_down,
            color: Colors.white,
            ),

             items: items.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items,textAlign: TextAlign.center),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                dropdownvalue = newValue!;
              });
            },
          ),
        ),
      ),
    ],
    );

  }
}
