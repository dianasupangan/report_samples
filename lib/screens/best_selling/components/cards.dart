import 'package:flutter/material.dart';
import 'package:report_samples/data/best_selling_data.dart';

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
        //Total stock cost card
        Card(
          child: SizedBox(
            height: 170,
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
    int highSoldStock = 0;

    for (var i = 0; i < bestSellingData.length; i++) {
      //get stock
      final listSoldStock = bestSellingData[i]["sold_stock"];

      //compare saved data to stock number
      if (int.parse(listSoldStock) > highSoldStock) {
        highSoldStock = int.parse(listSoldStock);
      }
    }
    setState(() {
      soldStock = highSoldStock;
    });
  }
}
