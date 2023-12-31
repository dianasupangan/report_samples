import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';
import 'package:report_samples/data/wow_data.dart';
import 'package:week_of_year/week_of_year.dart';

class WeekReport extends StatefulWidget {
  const WeekReport({super.key});

  @override
  State<WeekReport> createState() => _WeekReportState();
}

class _WeekReportState extends State<WeekReport> {
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
    int weekOne = 0;
    int weekTwo = 0;
    int weekThree = 0;
    int weekFour = 0;
    //Get current date
    final weekNow = DateTime.now().weekOfYear;
    final yearNow = DateTime.now().year;

    for (var i = 0; i < weekOnWeek.length; i++) {
      final year = (DateTime.parse(weekOnWeek[i]["date"])).year;
      if (year == yearNow) {
        if (DateTime.parse(weekOnWeek[i]["date"]).weekOfYear ==
            int.parse(weekNow.toString()) - 3) {
          weekOne = int.parse(weekOnWeek[i]["sold_stock"]);
        }
        if (DateTime.parse(weekOnWeek[i]["date"]).weekOfYear ==
            int.parse(weekNow.toString()) - 2) {
          weekTwo = int.parse(weekOnWeek[i]["sold_stock"]);
        }
        if (DateTime.parse(weekOnWeek[i]["date"]).weekOfYear ==
            int.parse(weekNow.toString()) - 1) {
          weekThree = int.parse(weekOnWeek[i]["sold_stock"]);
        }
        if (DateTime.parse(weekOnWeek[i]["date"]).weekOfYear ==
            int.parse(weekNow.toString())) {
          weekFour = int.parse(weekOnWeek[i]["sold_stock"]);
        }
      }
    }

    final List<Map> chartData = [
      {
        "item": "Week ${int.parse(weekNow.toString()) - 3}",
        "sold_stock": weekOne.toString(),
      },
      {
        "item": "Week ${int.parse(weekNow.toString()) - 2}",
        "sold_stock": weekTwo.toString(),
      },
      {
        "item": "Week ${int.parse(weekNow.toString()) - 1}",
        "sold_stock": weekThree.toString(),
      },
      {
        "item": "Week $weekNow",
        "sold_stock": weekFour.toString(),
      }
    ];
    return chartData;
  }

  int weekNumber(String date) {
    final weekNow = DateTime.parse(date).weekOfYear;
    return weekNow;
  }
}
