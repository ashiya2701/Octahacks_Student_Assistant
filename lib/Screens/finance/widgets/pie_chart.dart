import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:student_assistant_app/Screens/finance/models/transaction.dart';

class PieChartWidget extends StatefulWidget {
  List<Transaction> _userTransactions;

  PieChartWidget(this._userTransactions);

  @override
  State<PieChartWidget> createState() => _PieChartWidgetState();
}

class _PieChartWidgetState extends State<PieChartWidget> {
  @override
  Widget build(BuildContext context) {
    var datamap =
        categories.map((key, value) => MapEntry(key, double.parse('0')));

    for (var tx in widget._userTransactions) {
      datamap[categories.inverse[tx.category].toString()] =
          datamap[categories.inverse[tx.category].toString()]! + tx.amount;
    }

    return Container(
      child: PieChart(
        dataMap: datamap,
        chartType: ChartType.disc,
      ),
    );
  }
}

//for inverting categories
extension InvertMap<K, V> on Map<K, V> {
  Map<V, K> get inverse =>
      Map.fromEntries(entries.map((e) => MapEntry(e.value, e.key)));
}
