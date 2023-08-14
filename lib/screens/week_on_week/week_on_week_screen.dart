import 'package:flutter/material.dart';
import 'package:report_samples/utils/drawer.dart';

import 'components/table.dart';
import 'components/chart.dart';

class WeekOnWeek extends StatelessWidget {
  static const routeName = "/week_on_week";
  const WeekOnWeek({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Week-On-Week Report"),
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
              ReportChart(),
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
