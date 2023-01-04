// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:student_assistant_app/Screens/finance/widgets/balancewidget.dart';
import './widgets/new_transaction.dart';
import './widgets/transactionlist.dart';
import './widgets/user_transaction.dart';

import 'package:intl/intl.dart';

///\

import 'models/transaction.dart';

class FinanceScreen extends StatefulWidget {
  @override
  State<FinanceScreen> createState() => _FinanceScreenState();
}

class _FinanceScreenState extends State<FinanceScreen> {
  final List<Transaction> _userTransactions = [
    Transaction(id: '43', title: 'Shoes', amount: 69, date: DateTime.now()),
    Transaction(
        id: '12', title: 'Controller', amount: 329, date: DateTime.now()),
  ];

  double _currentBalance = 1500;

  void _addNewTransaction(String title, double amount) {
    final newTx = Transaction(
        title: title,
        amount: amount,
        date: DateTime.now(),
        id: DateTime.now().toString());
    setState(() {
      _userTransactions.add(newTx);
      _currentBalance -= amount;
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
            TransactionList(_userTransactions)
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
