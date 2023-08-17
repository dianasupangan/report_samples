import 'package:flutter/material.dart';

import '../../utils/drawer.dart';
import 'components/reports_grid.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      drawer: const Drawer(
        child: MenuDrawer(),
      ),
      body: const Center(
        child: ReportsGrid(),
      ),
    );
  }
}
