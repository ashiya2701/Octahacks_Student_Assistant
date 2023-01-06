// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:student_assistant_app/Screens/finance/models/transaction.dart';
import 'package:student_assistant_app/Screens/finance/widgets/balancewidget.dart';
import 'package:student_assistant_app/Screens/finance/widgets/chart.dart';
import 'package:student_assistant_app/Screens/finance/widgets/pie_chart.dart';
import './widgets/new_transaction.dart';
import './widgets/transactionlist.dart';
import './widgets/user_transaction.dart';
import './widgets/chart.dart';
import 'package:intl/intl.dart';

///

import 'models/transaction.dart' as Trans;

class FinanceScreen extends StatefulWidget {
  List<Trans.Transaction> _userTransactions = [];

  FinanceScreen(this._userTransactions) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection('transactions')
        .get()
        .then((QuerySnapshot qs) {
      qs.docs.forEach((doc) {
        _userTransactions = [];
        _userTransactions.add(Trans.Transaction(
            amount: doc['amount'],
            category: categories[doc['category']] as TransCategory,
            date: (doc['date'] as Timestamp).toDate(),
            id: doc.id,
            title: doc['title']));
      });
    });
  }

  @override
  State<FinanceScreen> createState() => _FinanceScreenState();
}

class _FinanceScreenState extends State<FinanceScreen> {
  // [
  //   Transaction(
  //       id: '1',
  //       title: 'Shoes',
  //       amount: 69,
  //       date: DateTime.now(),
  //       category: TransCategory.apparel),
  //   Transaction(
  //       id: '2',
  //       title: 'Controller',
  //       amount: 329,
  //       date: DateTime.now(),
  //       category: TransCategory.entertainment),
  //   Transaction(
  //       id: '3',
  //       title: 'Jacket',
  //       amount: 480,
  //       date: DateTime.now(),
  //       category: TransCategory.apparel),
  //   Transaction(
  //       id: '4',
  //       title: 'Gloves',
  //       amount: 200,
  //       date: DateTime.now(),
  //       category: TransCategory.apparel),
  // ];

  List<Trans.Transaction> get _recentTransactions {
    return widget._userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  double _currentBalance = 1500;

  void _addNewTransaction(
      String title, double amount, Trans.TransCategory category) {
    // final newTx = Trans.Transaction(
    //     title: title,
    //     amount: amount,
    //     date: DateTime.now(),
    //     id: DateTime.now().toString(),
    //     category: category);

    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection('transactions')
        .add({
      'title': title,
      'amount': amount,
      'date': Timestamp.fromDate(DateTime.now()),
      'category': inverseCategories[category]
    });

    List<Trans.Transaction> tx = [];
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection('transactions')
        .get()
        .then((QuerySnapshot qs) {
      qs.docs.forEach((doc) {
        tx.add(Trans.Transaction(
            amount: doc['amount'],
            category: categories[doc['category']] as TransCategory,
            date: (doc['date'] as Timestamp).toDate(),
            id: doc.id,
            title: doc['title']));
        print(tx);
      });
      setState(() {
        widget._userTransactions = tx;

        _currentBalance -= amount;
      });
    });
  }

  void startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (bCtx) {
          return GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child: NewTransaction(_addNewTransaction),
          );
        });
  }

  void increaseBalance(double amount) {
    setState(() {
      _currentBalance += amount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor.withOpacity(0.3),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            BalanceWidget(_currentBalance, increaseBalance),
            Chart(_recentTransactions),
            PieChartWidget(widget._userTransactions),
            TransactionList(widget._userTransactions)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => {startAddNewTransaction(context)},
      ),
    );
  }
}
