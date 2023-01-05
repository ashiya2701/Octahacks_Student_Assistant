import 'package:flutter/material.dart';
import 'package:student_assistant_app/Screens/finance/models/transaction.dart';

import '../../../utilities/constants.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  // String titleInput;
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  

  String selectedCategory = 'Others';

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Select Category',
                ),
                Container(
                  decoration: kBoxDecorationStyle,
                  child: DropdownButton(
                    iconEnabledColor: Theme.of(context).primaryColor,
                    items: categories.keys.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(items, textAlign: TextAlign.center),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedCategory = newValue!;
                      });
                    },
                    value: selectedCategory,
                    dropdownColor: Colors.blueAccent,
                    style: const TextStyle(
                        color: Colors.white, fontFamily: 'OpenSans'),
                    // Down Arrow Icon
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              color: Colors.black,
              height: 10,
            ),
            TextButton(
              onPressed: () {
                widget.addTx(
                    titleController.text,
                    double.parse(amountController.text),
                    categories[selectedCategory]);
              },
              child: Text(
                'Add Transaction',
                style: TextStyle(color: Colors.green),
              ),
            )
          ],
        ),
      ),
      elevation: 5,
    );
  }
}
