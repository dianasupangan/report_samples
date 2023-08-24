import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';
import 'package:report_samples/data/slow_moving_data.dart';

import '../../../data/promotion_data.dart';

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
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: 530,
                height: 200,
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
                  marks: [
                    IntervalMark(
                      label: LabelEncode(
                          encoder: (tuple) =>
                              Label(tuple['amount'].toString())),
                      elevation: ElevationEncode(value: 0, updaters: {
                        'tap': {true: (_) => 5}
                      }),
                      color:
                          ColorEncode(value: Defaults.primaryColor, updaters: {
                        'tap': {false: (color) => color.withAlpha(100)}
                      }),
                    )
                  ],
                  axes: [
                    Defaults.horizontalAxis,
                    Defaults.verticalAxis,
                  ],
                  selections: {'tap': PointSelection(dim: Dim.x)},
                  tooltip: TooltipGuide(),
                  crosshair: CrosshairGuide(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  List<Map> getChartData() {
    //Compute total units and total cost of the units
    int tenPercent = 0;
    int twentyPercent = 0;
    int thirtyPercent = 0;
    int fourtyPercent = 0;
    int fiftyPercent = 0;
    int sixtyPercent = 0;
    int seventyPercent = 0;
    int eightyPercent = 0;
    int ninetyPercent = 0;
    int oneHundredPercent = 0;

    for (var i = 0; i < promotionData.length; i++) {
      if (int.parse(promotionData[i]["discount"]) > 0 &&
          int.parse(promotionData[i]["discount"]) <= 10) {
        tenPercent += int.parse(promotionData[i]["sold_stock"]);
      } else if (int.parse(promotionData[i]["discount"]) > 10 &&
          int.parse(promotionData[i]["discount"]) <= 20) {
        twentyPercent += int.parse(promotionData[i]["sold_stock"]);
      } else if (int.parse(promotionData[i]["discount"]) > 20 &&
          int.parse(promotionData[i]["discount"]) <= 30) {
        thirtyPercent += 1;
      } else if (int.parse(promotionData[i]["discount"]) > 30 &&
          int.parse(promotionData[i]["discount"]) <= 40) {
        fourtyPercent += 1;
      } else if (int.parse(promotionData[i]["discount"]) > 40 &&
          int.parse(promotionData[i]["discount"]) <= 50) {
        fiftyPercent += 1;
      } else if (int.parse(promotionData[i]["discount"]) > 50 &&
          int.parse(promotionData[i]["discount"]) <= 60) {
        sixtyPercent += 1;
      } else if (int.parse(promotionData[i]["discount"]) > 60 &&
          int.parse(promotionData[i]["discount"]) <= 70) {
        seventyPercent += 1;
      } else if (int.parse(promotionData[i]["discount"]) > 70 &&
          int.parse(promotionData[i]["discount"]) <= 80) {
        eightyPercent += 1;
      } else if (int.parse(promotionData[i]["discount"]) > 80 &&
          int.parse(promotionData[i]["discount"]) <= 90) {
        ninetyPercent += 1;
      } else if (int.parse(promotionData[i]["discount"]) > 90 &&
          int.parse(promotionData[i]["discount"]) <= 99) {
        oneHundredPercent += 1;
      }
    }

    final List<Map> chartData = [
      {
        "name": "10%",
        "amount": tenPercent.toString(),
      },
      {
        "name": "20%",
        "amount": twentyPercent.toString(),
      },
      {
        "name": "30%",
        "amount": thirtyPercent.toString(),
      },
      {
        "name": "40%",
        "amount": fourtyPercent.toString(),
      },
      {
        "name": "50%",
        "amount": fiftyPercent.toString(),
      },
      {
        "name": "60%",
        "amount": sixtyPercent.toString(),
      },
      {
        "name": "70%",
        "amount": seventyPercent.toString(),
      },
      {
        "name": "80%",
        "amount": eightyPercent.toString(),
      },
      {
        "name": "90%",
        "amount": ninetyPercent.toString(),
      },
      {
        "name": "99%",
        "amount": oneHundredPercent.toString(),
      },
    ];
    return chartData;
  }
}
