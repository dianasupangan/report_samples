import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';
import 'package:intl/intl.dart';
import 'package:report_samples/data/near_expiry_data.dart';
import 'package:report_samples/data/wow_data.dart';
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
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: 190,
                height: 170,
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
              Container(
                padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
                alignment: Alignment.bottomLeft,
                margin: const EdgeInsets.only(top: 10),
                width: 120,
                height: 100,
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
                            SizedBox(
                              width: 5,
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
            ],
          ),
        ),
      ],
    );
  }

  List<Map> getChartData() {
    int weekOne = 1;
    int weekTwo = 1;
    int weekThree = 1;
    int weekFour = 1;
    //Get current date
    final weekNow = DateTime.now().weekOfYear;
    final yearNow = DateTime.now().year;

    // final oldestWeek
    //Minus 4
    final oldestDate = int.parse(weekNow.toString()) - 3;

    for (var i = 0; i < weekOnWeek.length; i++) {
      final year = (DateTime.parse(weekOnWeek[i]["date"])).year;
      if(year == yearNow){
        if()
      }
    }

    final List<Map> chartData = [
      {
        "name": "Week ${int.parse(weekNow.toString()) - 3}",
        "amount": weekOne.toString(),
      },
      {
        "name": "Week ${int.parse(weekNow.toString()) - 2}",
        "amount": weekTwo.toString(),
      },
      {
        "name": "Week ${int.parse(weekNow.toString()) - 1}",
        "amount": weekThree.toString(),
      },
      {
        "name": "Week $weekNow",
        "amount": weekFour.toString(),
      }
    ];
    return chartData;
  }

  int weekNumber(String date){
    final weekNow = DateTime.parse(date).weekOfYear;
    return weekNow;
  }
}
