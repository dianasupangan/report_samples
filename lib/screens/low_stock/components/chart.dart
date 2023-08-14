import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';
import 'package:report_samples/data/low_stock_data.dart';

class ReportChart extends StatefulWidget {
  const ReportChart({super.key});

  @override
  State<ReportChart> createState() => _ReportChartState();
}

class _ReportChartState extends State<ReportChart> {
  List<Map> chartData = [];
  @override
  void initState() {
    chartData = getChartData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //Chart card
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Items low in stock",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
                  alignment: Alignment.bottomLeft,
                  margin: const EdgeInsets.only(top: 10),
                  width: 350,
                  height: 120,
                  child: ListView.builder(
                    itemCount: chartData.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                height: 10,
                                width: 10,
                                child: Container(
                                  height: double.infinity,
                                  width: double.infinity,
                                  color: Defaults.colors10[index],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Item ${chartData[index]["name"]} = ${chartData[index]["amount"]} units",
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  List<Map> getChartData() {
    //Compute total units and total cost of the units
    List<Map> lowStock = [];

    for (var i = 0; i < lowStockData.length; i++) {
      if (int.parse(lowStockData[i]['stock_left']) <= 10) {
        lowStock.add({
          "name": lowStockData[i]['item'],
          "amount": lowStockData[i]['stock_left'],
        });
      }
    }
    return lowStock;
  }
}
