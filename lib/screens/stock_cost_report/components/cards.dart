import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../data/stock_cost_data.dart';

class Cards extends StatefulWidget {
  const Cards({super.key});

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  final formatCurrency = NumberFormat.currency(symbol: "₱");
  int onHandStock = 0;
  int stockCost = 0;
  int costPerUnit = 0;
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
          child: Container(
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
                      onHandStock.toString(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      " Units",
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
                  "Total Stocks",
                  style: TextStyle(fontSize: 15),
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
                      formatCurrency.format(
                        double.parse(
                          costPerUnit.toString(),
                        ),
                      ),
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
                  "Total Stock Cost per Unit",
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
                      formatCurrency.format(
                        double.parse(
                          stockCost.toString(),
                        ),
                      ),
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
                  "Total Stock Cost",
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
    int totalItemsOnHand = 0;
    int totalStockCost = 0;
    int totalCostPerUnit = 0;

    for (var i = 0; i < stockCostData.length; i++) {
      final addOnHand = stockCostData[i]["on_hand_qty"];
      final addStockCost = stockCostData[i]["total_cost"];
      final addCostPerUnit = stockCostData[i]["unit_cost"];

      totalItemsOnHand += int.parse(addOnHand!);
      totalStockCost += int.parse(addStockCost!);
      totalCostPerUnit += int.parse(addCostPerUnit!);
    }
    setState(() {
      onHandStock = totalItemsOnHand;
      stockCost = totalStockCost;
      costPerUnit = totalCostPerUnit;
    });
  }
}
