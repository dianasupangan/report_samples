import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';
import 'package:report_samples/data/mom_data.dart';
import 'package:week_of_year/week_of_year.dart';

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
                width: 450,
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
    int monthOne = 0;
    int monthTwo = 0;
    int monthThree = 0;
    int monthFour = 0;
    int monthFive = 0;
    int monthSix = 0;
    //Get current date
    final monthNow = DateTime.now().month;
    final yearNow = DateTime.now().year;

    // final oldestWeek
    //Minus 4

    for (var i = 0; i < monthOnMonth.length; i++) {
      final year = (DateTime.parse(monthOnMonth[i]["date"])).year;
      if (year == yearNow) {
        if (DateTime.parse(monthOnMonth[i]["date"]).month ==
            int.parse(monthNow.toString()) - 5) {
          monthOne = int.parse(monthOnMonth[i]["sold_stock"]);
        }
        if (DateTime.parse(monthOnMonth[i]["date"]).month ==
            int.parse(monthNow.toString()) - 4) {
          monthTwo = int.parse(monthOnMonth[i]["sold_stock"]);
        }
        if (DateTime.parse(monthOnMonth[i]["date"]).month ==
            int.parse(monthNow.toString()) - 3) {
          monthThree = int.parse(monthOnMonth[i]["sold_stock"]);
        }
        if (DateTime.parse(monthOnMonth[i]["date"]).month ==
            int.parse(monthNow.toString()) - 2) {
          monthFour = int.parse(monthOnMonth[i]["sold_stock"]);
        }
        if (DateTime.parse(monthOnMonth[i]["date"]).month ==
            int.parse(monthNow.toString()) - 1) {
          monthFive = int.parse(monthOnMonth[i]["sold_stock"]);
        }
        if (DateTime.parse(monthOnMonth[i]["date"]).month ==
            int.parse(monthNow.toString())) {
          monthSix = int.parse(monthOnMonth[i]["sold_stock"]);
        }
      }
    }

    final List<Map> chartData = [
      {
        "item": "${int.parse(monthNow.toString()) - 5}/$yearNow",
        "sold_stock": monthOne.toString(),
      },
      {
        "item": "${int.parse(monthNow.toString()) - 4}/$yearNow",
        "sold_stock": monthTwo.toString(),
      },
      {
        "item": "${int.parse(monthNow.toString()) - 3}/$yearNow",
        "sold_stock": monthThree.toString(),
      },
      {
        "item": "${int.parse(monthNow.toString()) - 2}/$yearNow",
        "sold_stock": monthFour.toString(),
      },
      {
        "item": "${int.parse(monthNow.toString()) - 1}/$yearNow",
        "sold_stock": monthFive.toString(),
      },
      {
        "item": "$monthNow/$yearNow",
        "sold_stock": monthSix.toString(),
      }
    ];
    return chartData;
  }

  int weekNumber(String date) {
    final weekNow = DateTime.parse(date).weekOfYear;
    return weekNow;
  }
}
