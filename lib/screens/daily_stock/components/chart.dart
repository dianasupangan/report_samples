import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';

import '../../../data/daily_stock_data.dart';

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
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: 190,
                height: 180,
                child: Chart(
                  data: chartData,
                  variables: {
                    'name': Variable(
                      accessor: (Map map) => map['name'] as String,
                    ),
                    'amount': Variable(
                      accessor: (Map map) => int.parse(map['amount']),
                    ),
                  },
                  transforms: [
                    Proportion(
                      variable: 'amount',
                      as: 'percent',
                    )
                  ],
                  marks: [
                    IntervalMark(
                      position: Varset('percent') / Varset('name'),
                      label: LabelEncode(
                        encoder: (tuple) => Label(
                          tuple['amount'].toString(),
                          LabelStyle(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      color: ColorEncode(
                          variable: 'name', values: Defaults.colors10),
                      modifiers: [StackModifier()],
                    )
                  ],
                  coord: PolarCoord(transposed: true, dimCount: 1),
                ),
              ),
            ],
          ),
        ),
        Card(
          child: Container(
            padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
            alignment: Alignment.bottomLeft,
            margin: const EdgeInsets.only(top: 10),
            width: 190,
            height: 180,
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
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          chartData[index]["name"].toString(),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  List<Map> getChartData() {
    //Compute total units and total cost of the units
    int totalClosingStock = 0;
    int totalSoldStock = 0;

    for (var i = 0; i < dailyStock.length; i++) {
      final addClosingStock = dailyStock[i]["closing_stock"];
      final addSoldStock = dailyStock[i]["sold_stock"];

      totalClosingStock += int.parse(addClosingStock!);
      totalSoldStock += int.parse(addSoldStock!);
    }

    final List<Map> chartData = [
      {
        "name": "Closing Stock",
        "amount": totalClosingStock.toString(),
      },
      {
        "name": "Sold Stock",
        "amount": totalSoldStock.toString(),
      },
    ];
    return chartData;
  }
}
