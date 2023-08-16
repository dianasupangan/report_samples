import 'package:flutter/material.dart';
import 'package:report_samples/utils/drawer.dart';

import '../best_selling/components/cards.dart';
import 'components/table.dart';
import 'components/chart.dart';

class PlatformUsedScreen extends StatelessWidget {
  static const routeName = "/platform_used_screen";
  const PlatformUsedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Platform Used"),
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
