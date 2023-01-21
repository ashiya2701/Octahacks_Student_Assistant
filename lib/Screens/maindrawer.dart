import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:student_assistant_app/Screens/calender/profile/prof.dart';

class MainDrawer extends StatelessWidget {
  final FirebaseAuth auth = FirebaseAuth.instance;

  final _currentUser;
  MainDrawer(this._currentUser);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        Container(
          height: 130,
          width: double.infinity,
          padding: EdgeInsets.all(20),
          alignment: Alignment.centerLeft,
          child: Text('Hello, ${_currentUser?['Name']}', style: TextStyle(fontSize: 20),),
        ),
        // SizedBox(
        //   height: 5,
        // ),
        Theme(
          data: ThemeData(
            splashColor: Colors.blue[100],
            highlightColor: Colors.blue.withOpacity(.5),
          ),
          child: ListTile(
            leading: Icon(Icons.settings, size: 26),
            title: Text("Settings"),
            onTap: () {},
          ),
        ),
        Theme(
            data: ThemeData(
              splashColor: Colors.blue[100],
              highlightColor: Colors.blue.withOpacity(.5),
            ),
            child: ListTile(
              leading: Icon(Icons.man, size: 26),
              title: Text("Profile"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Profile(_currentUser)));
              },
            ))
      ]),
    );
  }
}
