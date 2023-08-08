import 'package:flutter/material.dart';
import 'package:report_samples/utils/drawer.dart';

import 'components/table.dart';
import 'components/cards.dart';
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
