import 'package:flutter/material.dart';

import '../../../../utils/money_format.dart';

class MonthlyTotalSold extends StatefulWidget {
  const MonthlyTotalSold({super.key});

  @override
  State<MonthlyTotalSold> createState() => _MonthlyTotalSoldState();
}

class _MonthlyTotalSoldState extends State<MonthlyTotalSold> {
  String getMonthlyTotal = '';
  @override
  void initState() {
    getMonthlyTotal = getTotal();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                getMonthlyTotal,
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                " Total",
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
            ],
          ),
          Text(
            "Monthly Sold",
            style: TextStyle(
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }

  String getTotal() {
    const totalSold = 1491923;

    return formatToMoney(totalSold);
  }
}
