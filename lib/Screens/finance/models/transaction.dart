import 'package:flutter/cupertino.dart';

class Transaction {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final TransCategory category;

//{for named arguments}
  Transaction(
      {required this.id,
      required this.title,
      required this.amount,
      required this.date,
      required this.category});
}

enum TransCategory {
  fees,
  education,
  food,
  apparel,
  transportation,
  entertainment,
  others,
}

final Map<String, TransCategory> categories = {
  'Fees': TransCategory.fees,
  'Education': TransCategory.education,
  'Food': TransCategory.food,
  'Apparel': TransCategory.apparel,
  'Transportation': TransCategory.transportation,
  'Entertainment': TransCategory.entertainment,
  'Others': TransCategory.others,
};
