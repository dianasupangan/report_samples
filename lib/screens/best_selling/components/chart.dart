import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';
import 'package:report_samples/data/best_selling_data.dart';
import '../../../data/data.dart';

class ReportChart extends StatefulWidget {
  const ReportChart({super.key});

  @override
  State<ReportChart> createState() => _ReportChartState();
}

class _ReportChartState extends State<ReportChart> {
  List<Map> chartData = bestSellingData;

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
                width: 250,
                height: 170,
                child: Chart(
                  data: bestSellingData,
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
}
