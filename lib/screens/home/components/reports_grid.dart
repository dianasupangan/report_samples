import 'package:flutter/material.dart';
import 'package:report_samples/screens/home/components/cards/month_total_sold.dart';
import 'package:report_samples/screens/home/components/cards/week_total_sold.dart';
import 'package:report_samples/screens/home/components/cards/year_total_sold.dart';
import 'package:report_samples/screens/home/components/charts/week_chart_report.dart';

import 'charts/month_chart.dart';
import 'charts/year_chart.dart';

class ReportsGrid extends StatefulWidget {
  const ReportsGrid({super.key});

  @override
  State<ReportsGrid> createState() => _ReportsGridState();
}

class _ReportsGridState extends State<ReportsGrid> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: <TableRow>[
          TableRow(
            children: <Widget>[
              Card(
                child: Container(
                  child: const YearReport(),
                ),
              ),
              Card(
                child: Container(
                  child: const MonthReport(),
                ),
              ),
              Card(
                child: Container(
                  child: const WeekReport(),
                ),
              ),
            ],
          ),
          TableRow(
            children: <Widget>[
              Card(
                child: Container(
                  child: const YearlyTotalSold(),
                ),
              ),
              Card(
                child: Container(
                  child: const MonthlyTotalSold(),
                ),
              ),
              Card(
                child: Container(
                  child: const WeeklyTotalSold(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
