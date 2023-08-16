import 'package:flutter/material.dart';

import '../../../../utils/money_format.dart';

class YearlyTotalSold extends StatefulWidget {
  const YearlyTotalSold({super.key});

  @override
  State<YearlyTotalSold> createState() => _YearlyTotalSoldState();
}

class _YearlyTotalSoldState extends State<YearlyTotalSold> {
  String getYearlTotal = '';
  @override
  void initState() {
    getYearlTotal = getTotal();
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
                getYearlTotal,
                style: const TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                " Total",
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
            ],
          ),
          const Text(
            "Yearly Sold",
            style: TextStyle(
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }

  String getTotal() {
    const totalSold = 5491923;

    return formatToMoney(totalSold);
  }
}
