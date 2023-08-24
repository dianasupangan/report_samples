import 'package:flutter/material.dart';
import 'package:report_samples/utils/drawer.dart';

import 'components/table.dart';

class SellThroughReport extends StatelessWidget {
  static const routeName = "/sell-through-report";
  const SellThroughReport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sell Through Reports"),
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
              Text("- Percentage of sold stock per item."),
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
