import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  final FirebaseAuth auth = FirebaseAuth.instance;
  

  

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        Container(
          height: 120,
          width: double.infinity,
          padding: EdgeInsets.all(20),
          alignment: Alignment.centerLeft,
          child: Text('Hello, ${auth.currentUser?.uid}'),
        ),
        SizedBox(
          height: 20,
        ),
        // ListTile(
        //   leading: Icon(Icons.settings, size: 26),
        //   title: Text('Settings'),
        //   onTap: () {},
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
              onTap: () {},
            ))
      ]),
    );
  }
}
