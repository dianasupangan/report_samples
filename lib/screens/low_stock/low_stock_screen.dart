import 'package:flutter/material.dart';
import 'components/chart.dart';
import 'components/cards.dart';
import '../../utils/drawer.dart';
import 'components/table.dart';

class LowStockReportScreen extends StatelessWidget {
  static const routeName = "/low-stock-report";
  const LowStockReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Low Stock Report"),
      ),
      drawer: const Drawer(
        child: MenuDrawer(),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
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
