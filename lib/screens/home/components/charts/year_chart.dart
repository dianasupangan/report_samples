import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';
import 'package:report_samples/data/yoy_data.dart';
import 'package:week_of_year/week_of_year.dart';

class YearReport extends StatefulWidget {
  const YearReport({super.key});

  @override
  State<YearReport> createState() => _YearReportState();
}

class _YearReportState extends State<YearReport> {
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
        Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10),
              width: 285,
              height: 190,
              child: Chart(
                data: chartData,
                variables: {
                  'item': Variable(
                    accessor: (Map map) => map['item'] as String,
                  ),
                  'sold_stock': Variable(
                    accessor: (Map map) => int.parse(map['sold_stock']),
                  ),
                },
                marks: [
                  IntervalMark(
                    label: LabelEncode(
                        encoder: (tuple) =>
                            Label(tuple['sold_stock'].toString())),
                    elevation: ElevationEncode(value: 0, updaters: {
                      'tap': {true: (_) => 5}
                    }),
                    color: ColorEncode(value: Defaults.primaryColor, updaters: {
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
      ],
    );
  }

  List<Map> getChartData() {
    int yearOne = 0;
    int yearTwo = 0;
    int yearThree = 0;
    int yearFour = 0;
    int yearFive = 0;
    int yearSix = 0;

    //Get current date
    final yearNow = DateTime.now().year;

    for (var i = 0; i < yearOnYear.length; i++) {
      if (DateTime.parse(yearOnYear[i]["date"]).year ==
          int.parse(yearNow.toString()) - 5) {
        yearOne = int.parse(yearOnYear[i]["sold_stock"]);
      }
      if (DateTime.parse(yearOnYear[i]["date"]).year ==
          int.parse(yearNow.toString()) - 4) {
        yearTwo = int.parse(yearOnYear[i]["sold_stock"]);
      }
      if (DateTime.parse(yearOnYear[i]["date"]).year ==
          int.parse(yearNow.toString()) - 3) {
        yearThree = int.parse(yearOnYear[i]["sold_stock"]);
      }
      if (DateTime.parse(yearOnYear[i]["date"]).year ==
          int.parse(yearNow.toString()) - 2) {
        yearFour = int.parse(yearOnYear[i]["sold_stock"]);
      }
      if (DateTime.parse(yearOnYear[i]["date"]).year ==
          int.parse(yearNow.toString()) - 1) {
        yearFive = int.parse(yearOnYear[i]["sold_stock"]);
      }
      if (DateTime.parse(yearOnYear[i]["date"]).year ==
          int.parse(yearNow.toString())) {
        yearSix = int.parse(yearOnYear[i]["sold_stock"]);
      }
    }

    final List<Map> chartData = [
      {
        "item": "${int.parse(yearNow.toString()) - 5}",
        "sold_stock": yearOne.toString(),
      },
      {
        "item": "${int.parse(yearNow.toString()) - 4}",
        "sold_stock": yearTwo.toString(),
      },
      {
        "item": "${int.parse(yearNow.toString()) - 3}",
        "sold_stock": yearThree.toString(),
      },
      {
        "item": "${int.parse(yearNow.toString()) - 2}",
        "sold_stock": yearFour.toString(),
      },
      {
        "item": "${int.parse(yearNow.toString()) - 1}",
        "sold_stock": yearFive.toString(),
      },
      {
        "item": "$yearNow",
        "sold_stock": yearSix.toString(),
      }
    ];
    return chartData;
  }

  int weekNumber(String date) {
    final weekNow = DateTime.parse(date).weekOfYear;
    return weekNow;
  }
}
