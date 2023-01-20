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
      appBar: AppBar(actions: []),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            child: Icon(
              Icons.person,
              size: 150,
            ),
            alignment: Alignment.center,
          ),
          Container(
            child: Text(widget._currentUser['Name']),
          ),
          Container(
            child: Text(widget._currentUser['College']),
          ),
          Container(
            child: Text(widget._currentUser['Gradyear'].toString()),
          ),
          Container(
            child: Text(widget._currentUser['Major']),
          ),
          Container(
            child: Text(widget._currentUser['CGPA'].toString()),
          ),
          Container(
            child: Text(widget._currentUser['Careers']),
          ),
          SizedBox(
              height: 200,
              child: ListView.builder(
                  itemCount: widget.skills.length,
                  itemBuilder: (context, index) {
                    return Text(widget.skills[index]);
                  }))
        ],
      )),
    );
  }
}
