import 'package:flutter/material.dart';
import 'package:report_samples/screens/stock_cost_report/components/cards.dart';
import 'package:report_samples/screens/stock_cost_report/components/table.dart';

import '../../utils/drawer.dart';

class StockCostReportScreen extends StatelessWidget {
  static const routeName = "/stock-cost-report";
  const StockCostReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stock Cost Report"),
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
              Padding(
                padding: EdgeInsets.fromLTRB(0, 40, 0, 20),
                child: Text(
                    "- This page reports the the stock quantities, price per unit and total price of each item."),
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
