import 'package:flutter/material.dart';
import '../models/transaction.dart';

import 'new_transaction.dart';
import 'transactionlist.dart';

class UserTransactions extends StatefulWidget {
  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       // NewTransaction(_addNewTransaction),
      ],
    );
  }
}
