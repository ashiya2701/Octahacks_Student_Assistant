import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class JobsScreen extends StatefulWidget {
  List skills = [];
  int gradyear = 0;
  List careerInterest = [];
  double cgpa = 0;
  String major = "";
  String college = "";

  JobsScreen(_currentUser) {
    skills = (_currentUser["Skills"] as List).map((e) => e.toString()).toList();
    gradyear = int.parse(_currentUser["Gradyear"].toString());
    // careerInterest =
    //     (_currentUser["Careers"] as List).map((e) => e.toString()).toList();
    print(_currentUser);
    cgpa = double.parse(_currentUser["CGPA"].toString());
    major = _currentUser["Major"].toString();
    college = _currentUser["College"].toString();
  }

  @override
  State<JobsScreen> createState() => _JobsScreenState();
}

class _JobsScreenState extends State<JobsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(widget.cgpa.toString()),
    );
  }
}
