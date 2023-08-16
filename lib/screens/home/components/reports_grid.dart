import 'package:flutter/material.dart';
import 'package:report_samples/screens/home/components/cards/month_total_sold.dart';
import 'package:report_samples/screens/home/components/cards/week_total_sold.dart';
import 'package:report_samples/screens/home/components/cards/year_total_sold.dart';
import 'package:report_samples/screens/year_on_year/year_on_year_screen.dart';

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
                  child: const Text("Hi"),
                ),
              ),
              Card(
                child: Container(
                  child: Text("Hi"),
                ),
              ),
              Card(
                child: Container(
                  child: Text("Hi"),
                ),
              ),
            ],
          ),
          TableRow(
            children: <Widget>[
              Card(
                child: Container(
                  child: YearlyTotalSold(),
                ),
              ),
              Card(
                child: Container(
                  child: MonthlyTotalSold(),
                ),
              ),
              Card(
                child: Container(
                  child: WeeklyTotalSold(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
