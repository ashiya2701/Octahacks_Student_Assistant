import 'package:flutter/material.dart';

class BalanceAdder extends StatefulWidget {
  final Function increaseAmount;

  BalanceAdder(this.increaseAmount);

  @override
  State<BalanceAdder> createState() => _BalanceAdderState();
}

class _BalanceAdderState extends State<BalanceAdder> {
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void showBalanceAddSheet() {
      showModalBottomSheet(
          context: context,
          builder: (bCtx) {
            return GestureDetector(
                onTap: () {},
                behavior: HitTestBehavior.opaque,
                child: Card(
                  child: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TextField(
                            decoration: InputDecoration(labelText: 'Amount'),
                            controller: amountController,
                          ),
                          TextButton(
                            onPressed: () {
                              widget.increaseAmount(
                                  double.parse(amountController.text));
                            },
                            child: Text(
                              'Add Balance',
                              style: TextStyle(color: Colors.green),
                            ),
                          )
                        ],
                      )),
                  elevation: 5,
                ));
          });
    }

    return Container(
      child: ElevatedButton(
        child: Text('Add balance'),
        onPressed: () {
          showBalanceAddSheet();  
        },
      ),
    );
  }
}
