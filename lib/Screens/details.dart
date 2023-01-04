import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:student_assistant_app/Screens/home.dart';
import 'package:student_assistant_app/Screens/skillwidget.dart';
import 'package:student_assistant_app/utilities/constants.dart';

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  CollectionReference Users = FirebaseFirestore.instance.collection('Users');
  TextEditingController _date = TextEditingController();
  TextEditingController _name=TextEditingController();
  TextEditingController _college=TextEditingController();
  TextEditingController _cgpa=TextEditingController();
  TextEditingController _branch=TextEditingController();

  String dropdownvalue = 'Item 1';

  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  Widget _buildCareers() {
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
          child: Center(
            child: DropdownButton(
              // Initial Value
              value: dropdownvalue,
              dropdownColor: Colors.blueAccent,
              style:
                  const TextStyle(color: Colors.white, fontFamily: 'OpenSans'),
              // Down Arrow Icon
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: Colors.white,
              ),

              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items, textAlign: TextAlign.center),
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

  Widget _buildTF(String x, String y, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          x,
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: controller,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              //contentPadding: EdgeInsets.only(top: 14.0),
              hintText: y,
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGradYear() {
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
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(DateTime.now().year - 100, 1),
                  lastDate: DateTime(DateTime.now().year + 100, 1),
                );
                if (pickedDate != null) {
                  setState(() {
                    _date.text = pickedDate.year.toString();
                  });
                }
              }),
        ),
      ],
    );
  }

  Widget _buildSubmitButton() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
          print('submit Button Pressed');
          print(_name.text);
          print(_college.text);
          print(dropdownvalue);
          print(_branch.text);
          print(_date.text);
          print(double.parse(_cgpa.text));
          await Users.add({
            "Name": _name.text,
            "CGPA": double.parse(_cgpa.text),
            "Careers": dropdownvalue,
            "College": _college.text,
            "Major": _branch.text,
            "Gradyear": _date.text,
            "Skills": ["C++", "Java"],
          }).then((value) => print("Uers data added"));
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        },
        style: ElevatedButton.styleFrom(
          elevation: 5.0,
          padding: EdgeInsets.all(15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          backgroundColor: Colors.white,
        ),
        child: Text(
          'SUBMIT',
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF73AEF5),
                      Color(0xFF61A4F1),
                      Color(0xFF478DE0),
                      Color(0xFF398AE5),
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9],
                  ),
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 120.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Fill Your Details',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 30.0),
                      _buildTF('Name', 'Enter your Full Name', _name),
                      SizedBox(height: 30.0),
                      _buildTF('College/School', 'Enter your College/School',
                          _college),
                      SizedBox(height: 30.0),
                      _buildTF('CGPA', 'Enter your CGPA out of 10', _cgpa),
                      SizedBox(height: 30.0),
                      _buildTF('Major', 'Enter your Branch/Major', _branch),
                      SizedBox(height: 30.0),
                      _buildGradYear(),
                      SizedBox(height: 30.0),
                      _buildCareers(),
                      SizedBox(height: 30.0),
                      MultiSelectDropDownScreen(),
                      SizedBox(height: 30.0),
                      _buildSubmitButton()
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
