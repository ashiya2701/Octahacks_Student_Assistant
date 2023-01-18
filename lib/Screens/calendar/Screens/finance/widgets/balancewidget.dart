import 'package:flutter/material.dart';
import 'package:student_assistant_app/Screens/finance/widgets/balance_adder.dart';

class BalanceWidget extends StatefulWidget {
  final double _currentBalance;
  final Function increaseBalance;

  BalanceWidget(this._currentBalance, this.increaseBalance);

  @override
  State<BalanceWidget> createState() => _BalanceWidgetState();
}

class _BalanceWidgetState extends State<BalanceWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Row(
          children: [
            Text(
              'Current Balance : ${widget._currentBalance}',
              style: TextStyle(fontSize: 15),
            ),
            BalanceAdder(widget.increaseBalance)
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
        width: double.infinity,
      ),
      elevation: 5,
    );
  }
}
