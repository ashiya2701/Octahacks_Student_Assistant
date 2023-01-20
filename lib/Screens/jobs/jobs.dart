import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:student_assistant_app/utilities/constants.dart';

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
  DatabaseReference reference = FirebaseDatabase.instance.ref().child('Jobs');
  Query query = FirebaseDatabase.instance.ref().child('Jobs').limitToFirst(5);
  //DataSnapshot event =await query.get();

  Widget listItem({required Map job}) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xFF478DE0),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 130,
      //color: Colors.indigo[300],
      child: Column(
        children: [
          Text(
            "Job Title: " + job['Job Title'],
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "CTC: " + job['CTC'],
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "Location: " + job['Location'],
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.white30,
                      )
                    ],
                  ))
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Jobs Listings'),
        ),
        body: Container(
          height: double.infinity,
          child: FirebaseAnimatedList(
              query: query,
              itemBuilder: (BuildContext context, DataSnapshot snapshot,
                  Animation<double> animation, int index) {
                Map job = snapshot.value as Map;
                job['key'] = snapshot.key;
                return listItem(job: job);
              }),
        ));
  }
}
