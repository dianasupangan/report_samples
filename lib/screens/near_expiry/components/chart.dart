import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';
import 'package:report_samples/data/near_expiry.dart';

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
                width: 190,
                height: 80,
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
    //Compute total units and total cost of the units
    int near = 0;
    int medium = 0;
    int far = 0;

    for (var i = 0; i < nearExpiryData.length; i++) {
      if (int.parse(nearExpiryData[i]["days_before_expiration"]) <= 14) {
        near += 1;
      } else if (int.parse(nearExpiryData[i]["days_before_expiration"]) > 14 &&
          int.parse(nearExpiryData[i]["days_before_expiration"]) <= 30) {
        medium += 1;
      } else if (int.parse(nearExpiryData[i]["days_before_expiration"]) > 31) {
        far += 1;
      }
    }

    final List<Map> chartData = [
      {
        "name": "Near Expiry",
        "amount": near.toString(),
      },
      {
        "name": "2 Weeks From Expiry",
        "amount": medium.toString(),
      },
      {
        "name": "1 Month From Expiry",
        "amount": far.toString(),
      },
    ];
    return chartData;
  }
}
