import 'package:flutter/material.dart';
import 'package:report_samples/utils/drawer.dart';

import 'components/table.dart';
import 'components/chart.dart';

class PromotionReport extends StatelessWidget {
  static const routeName = "/promotion-report";
  const PromotionReport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Promotion Reports"),
      ),
      drawer: const Drawer(
        child: MenuDrawer(),
      ),
      body: const SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text("- Monitor sale of discounted items."),
              SizedBox(
                height: 20,
              ),
              ReportChart(),
              SizedBox(
                height: 20,
              ),
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
