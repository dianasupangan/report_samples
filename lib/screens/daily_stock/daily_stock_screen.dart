import 'package:flutter/material.dart';
import 'package:report_samples/screens/daily_stock/components/chart.dart';
import 'package:report_samples/screens/daily_stock/components/cards.dart';
import '../../utils/drawer.dart';
import 'components/table.dart';

class DailyStockReportScreen extends StatelessWidget {
  static const routeName = "/daily-stock-report";
  const DailyStockReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daily Stock Report"),
      ),
      drawer: const Drawer(
        child: MenuDrawer(),
      ),
      body: const SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text("- Report of the stock sold per day"),
              SizedBox(
                height: 20,
              ),
              ReportChart(),
              SizedBox(
                height: 20,
              ),
              Cards(),
              SizedBox(
                height: 20,
              ),
              ReportTable(),
            ],
          ),
        ),
      ),
    );
  }
}
