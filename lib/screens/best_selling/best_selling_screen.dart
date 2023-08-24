import 'package:flutter/material.dart';
import '../best_selling/components/table.dart';

import '../../utils/drawer.dart';
import 'components/cards.dart';
import 'components/chart.dart';

class BestSelling extends StatelessWidget {
  static const routeName = "/best_selling";
  const BestSelling({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Best Selling"),
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
              Text("- Monitor the best selling items"),
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
