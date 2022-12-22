import 'package:student_assistant_app/utilities/constants.dart';
import 'package:flutter/material.dart';
class GradYear extends StatefulWidget {
  const GradYear({Key? key}) : super(key: key);

  @override
  State<GradYear> createState() => _GradYearState();
}

class _GradYearState extends State<GradYear> {
  TextEditingController _date= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'Enter Your Graduation Year',
        style: kLabelStyle,
      ),
      SizedBox(height: 10.0),
      Container(
        alignment: Alignment.centerLeft,
        decoration: kBoxDecorationStyle,
        height: 60.0,
        child: TextField(
          controller: _date,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'OpenSans',
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Expected Graduation Year',
            hintStyle: kHintTextStyle,
          ),
          onTap: () async{
            DateTime? pickedDate= await showDatePicker(
              context: context,
              initialDate:  DateTime.now(),
              firstDate: DateTime(DateTime.now().year - 100, 1),
              lastDate: DateTime(DateTime.now().year + 100, 1),


            );
            if(pickedDate!=null){
              setState(() {
                _date.text=pickedDate.year.toString();
              });
            }

          }
      ),
      ),
    ],
    );
  }
}
