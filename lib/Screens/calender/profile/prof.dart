import 'dart:ffi';

import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  var _currentUser;
  List<String> skills = [];

  Profile(this._currentUser) {
    print(_currentUser["Skills"]);
    for (var skill in _currentUser["Skills"]) {
      skills.add(skill.toString());
    }
    print(skills);
  }

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(actions: []),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            child: Row(
              children: [
                Icon(Icons.person,size: 150,),
                Text("Hello,", style: TextStyle(fontSize: 30),),
                Text(widget._currentUser['Name'], style: TextStyle(fontSize: 30),),
              ],
            ),
          ),
          // Container(
          //   child: Text(widget._currentUser['Name']),
          //   alignment: Alignment.centerRight,
          // ),
          SizedBox(height: 50),
          Container(
            color: Colors.blue[200],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.book, size: 20,),
                SizedBox(width: 5),
                Text(widget._currentUser['Major'], style: TextStyle(fontSize: 20,),),
              ],
            )
          ),
          SizedBox(height: 30,),
          Container(
            color: Colors.blue[200],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.school, size: 20,),
                SizedBox(width: 10,),
                Text(widget._currentUser['College'], style: TextStyle(fontSize: 20),),
            ],)
          ),
          SizedBox(height: 30,),
          Container(
            color: Colors.blue[200],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.calendar_month, size: 20,),
                SizedBox(width:5),
                Text(widget._currentUser['Gradyear'].toString(), style: TextStyle(fontSize: 20),),
              ],)
          ),
          SizedBox(height: 30,),
          Container(
            color: Colors.blue[200],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.percent, size: 20,),
                SizedBox(width: 5,),
                Text(widget._currentUser['CGPA'].toString(), style: TextStyle(fontSize: 20),),
              ],)
          ),
          SizedBox(height: 30,),
          Container(
            color: Colors.blue[200],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.engineering, size: 20,),
                SizedBox(width: 5,),
                Text(widget._currentUser['Careers'], style: TextStyle(fontSize: 20),),
              ]),
          ),
          SizedBox(height: 30,),
          Container(
            color: Colors.blue[200],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text("Skills", style: TextStyle(fontSize: 20),),
            ]),
          ),
          SizedBox(
              height: 200,
              //width: 600,
              child: ListView.builder(
                  itemCount: widget.skills.length,
                  itemBuilder: (context, index) {
                    return Text(widget.skills[index], style: TextStyle(fontSize: 20), textAlign: TextAlign.center,);
                  }))
        ],
      )),
    );
  }
}
