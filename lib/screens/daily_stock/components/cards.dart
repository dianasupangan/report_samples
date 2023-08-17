import 'package:flutter/material.dart';

import '../../../data/daily_stock_data.dart';

class Cards extends StatefulWidget {
  const Cards({super.key});

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  int openingStock = 0;
  int closingStock = 0;
  int soldStock = 0;
  List chartData = [];
  @override
  void initState() {
    computeCardValues();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //Total units card
        Card(
          child: SizedBox(
            height: 90,
            width: 160,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "$openingStock Units",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Opening Stocks",
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),

        //Total stock cost card
        Card(
          child: SizedBox(
            height: 90,
            width: 160,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "$closingStock Units",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Closing Stocks",
                  style: TextStyle(fontSize: 15),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        //Total stock cost card
        Card(
          child: SizedBox(
            height: 90,
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
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
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
    int totalOpeningStock = 0;
    int totalClosingStock = 0;
    int totalSoldStock = 0;

    for (var i = 0; i < dailyStock.length; i++) {
      final addOpeningStock = dailyStock[i]["opening_stock"];
      final addClosingStock = dailyStock[i]["closing_stock"];
      final addSoldStock = dailyStock[i]["sold_stock"];

      totalOpeningStock += int.parse(addOpeningStock!);
      totalClosingStock += int.parse(addClosingStock!);
      totalSoldStock += int.parse(addSoldStock!);
    }
    setState(() {
      openingStock = totalOpeningStock;
      closingStock = totalClosingStock;
      soldStock = totalSoldStock;
    });
  }
}
