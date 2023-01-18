import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function _deleteTransaction;

  TransactionList(this.transactions, this._deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300, //required to set a finite height for list view

      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            child: Row(
              children: [
                Row(
                  children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.green, width: 2)),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        '\$${transactions[index].amount}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.green),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          transactions[index].title,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(DateFormat.yMMMMd()
                            .format(transactions[index].date)),
                        Text(transactions[index]
                            .category
                            .toString()
                            .split('.')[1]),
                      ],
                    ),
                  ],
                ),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.only(right: 20),
                  child: GestureDetector(
                    child: ElevatedButton(
                      child: Icon(Icons.delete),
                      onPressed: () {
                        _deleteTransaction(transactions[index].id);
                      },
                    ),
                  ),
                )
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}
