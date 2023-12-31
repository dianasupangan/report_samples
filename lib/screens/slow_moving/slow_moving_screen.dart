import 'package:flutter/material.dart';
import 'package:report_samples/utils/drawer.dart';

import '../slow_moving/components/table.dart';
import 'components/cards.dart';
import 'components/chart.dart';

class SlowMovingScreen extends StatelessWidget {
  static const routeName = "/slow-moving-street";
  const SlowMovingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Slow Moving"),
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
              Text("- Monitor least sold items"),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ReportChart(),
                  SizedBox(
                    height: 20,
                  ),
                  Cards(),
                ],
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
