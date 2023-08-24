import 'package:flutter/material.dart';
import 'package:report_samples/utils/drawer.dart';

import 'components/table.dart';
import 'components/cards.dart';
import 'components/chart.dart';

class NearExpiryScreen extends StatelessWidget {
  static const routeName = "/near_expiry-screen";
  const NearExpiryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Near Expiry"),
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
              Text("- Show items near expiry"),
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
