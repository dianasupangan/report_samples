import 'package:flutter/material.dart';
import 'package:report_samples/utils/money_format.dart';

class WeeklyTotalSold extends StatefulWidget {
  const WeeklyTotalSold({super.key});

  @override
  State<WeeklyTotalSold> createState() => _WeeklyTotalSoldState();
}

class _WeeklyTotalSoldState extends State<WeeklyTotalSold> {
  String getWeeklyTotal = '';
  @override
  void initState() {
    getWeeklyTotal = getTotal();
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
                getWeeklyTotal,
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
            "Weekly Sold",
            style: TextStyle(
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }

  String getTotal() {
    const totalSold = 201923;

    return formatToMoney(totalSold);
  }
}
