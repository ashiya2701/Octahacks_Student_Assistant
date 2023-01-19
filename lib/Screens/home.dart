import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:student_assistant_app/Screens/calender/calender.dart';
import 'package:student_assistant_app/Screens/finance/finance.dart';
import 'package:student_assistant_app/Screens/finance/widgets/user_transaction.dart';
import 'package:student_assistant_app/Screens/jobs/jobs.dart';
import 'package:student_assistant_app/Screens/login.dart';
import 'package:student_assistant_app/Screens/maindrawer.dart';
import 'calender/models/task.dart';
import 'finance/models/transaction.dart' as Trans;

class HomeScreen extends StatefulWidget {
  List<Trans.Transaction> _userTransactions = [];
  var _currentUser;
  List<Task> _userEvents = [];

  HomeScreen({Key? key, currentUser, userTransactions, userEvents})
      : super(key: key) {
    _currentUser = currentUser;
    _userTransactions = userTransactions;
    _userEvents = userEvents;
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedSectionIndex = 0;

  void _selectSection(int index) {
    setState(() {
      _selectedSectionIndex = index;
    });
  }

  void _updateTransactionList(List<Trans.Transaction> l) {
    setState(() {
      widget._userTransactions = l;
    });
  }

  void _updateCurrentUserBalance(double v) {
    setState(() {
      widget._currentUser["Balance"] = v;
    });
  }

  void _updateUserEvents(List<Task> t) {
    setState(() {
       widget._userEvents = t;
    });
  }

  @override
  Widget build(BuildContext context) {
    // var args = ModalRoute.of(context)!.settings.arguments as List;
    // var _currentUser = args[0];
    // List<Trans.Transaction> _userTransactions = args[1];
    final List<Widget> _sections = [
      FinanceScreen(widget._userTransactions, widget._currentUser,
          _updateCurrentUserBalance, _updateTransactionList),
      Calender(widget._userEvents, _updateUserEvents),
      JobsScreen(widget._currentUser),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Student Assistant'),
        actions: [
          ElevatedButton(
            child: Text("Logout"),
            onPressed: () {
              FirebaseAuth.instance.signOut().then((value) {
                print("Signed Out");
                Navigator.popUntil(
                  context,
                  ModalRoute.withName('/login'),
                );
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              });
            },
          ),
        ],
      ),
      body: _sections[_selectedSectionIndex],
      drawer: MainDrawer(widget._currentUser),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: _selectedSectionIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.money), label: 'Expenses'),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month), label: 'Schedule'),
          BottomNavigationBarItem(icon: Icon(Icons.laptop), label: 'Jobs'),
        ],
        selectedItemColor: Theme.of(context).selectedRowColor,
        onTap: _selectSection,
      ),
    );
  }
}
