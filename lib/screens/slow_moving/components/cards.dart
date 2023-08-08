import 'package:flutter/material.dart';
import 'package:report_samples/data/slow_moving_data.dart';

class Cards extends StatefulWidget {
  const Cards({super.key});

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  int mostDaysInStock = 0;
  int soldStock = 0;
  List chartData = [];
  @override
  void initState() {
    computeCardValues();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //Total units card
        Card(
          child: Container(
            height: 130,
            width: 160,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "$mostDaysInStock Days",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Stored in the warehouse",
                  style: TextStyle(fontSize: 15),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),

        //Total stock cost card
        Card(
          child: Container(
            height: 130,
            width: 160,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "$soldStock Units",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Sold Stocks",
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void computeCardValues() {
    //Compute total units and total cost of the units
    int slowestStock = 0;
    int totalSoldStock = 0;

    for (var i = 0; i < slowMovingData.length; i++) {
      final addSoldStock = slowMovingData[i]["sold_stock"];
      final daysStockKept = slowMovingData[i]["days_stock_kept"];
      totalSoldStock += int.parse(addSoldStock!);

      if (int.parse(daysStockKept) > slowestStock) {
        slowestStock = int.parse(daysStockKept);
      }
    }
    setState(() {
      mostDaysInStock = slowestStock;
      soldStock = totalSoldStock;
    });
  }
}
