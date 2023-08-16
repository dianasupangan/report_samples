import 'package:flutter/material.dart';
import 'package:report_samples/screens/best_selling/best_selling_screen.dart';
import 'package:report_samples/screens/daily_stock/daily_stock_screen.dart';
import 'package:report_samples/screens/low_stock/low_stock_screen.dart';
import 'package:report_samples/screens/month_on_month/month_on_month_screen.dart';
import 'package:report_samples/screens/near_expiry/new_expiry_screen.dart';
import 'package:report_samples/screens/slow_moving/slow_moving_screen.dart';
import 'package:report_samples/screens/stock_cost_report/stock_cost_report_screen.dart';
import 'package:report_samples/screens/week_on_week/week_on_week_screen.dart';
import 'package:report_samples/screens/year_on_year/year_on_year_screen.dart';

import '../screens/platform_used/platform_used_screen.dart';

class MenuDrawer extends StatefulWidget {
  const MenuDrawer({super.key});

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          child: Text("Hi"),
        ),
        ListTile(
          leading: const Icon(Icons.home_outlined),
          title: const Text('Home'),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).pushReplacementNamed("/");
          },
        ),
        ListTile(
          leading: const Icon(Icons.airline_seat_individual_suite_outlined),
          title: const Text('Stock Cost Report'),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context)
                .pushReplacementNamed(StockCostReportScreen.routeName);
          },
        ),
        ListTile(
          leading: const Icon(Icons.edit_document),
          title: const Text('Daily Stock Report'),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context)
                .pushReplacementNamed(DailyStockReportScreen.routeName);
          },
        ),
        ListTile(
          leading: const Icon(Icons.checklist),
          title: const Text('Slow-Moving Report'),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context)
                .pushReplacementNamed(SlowMovingScreen.routeName);
          },
        ),
        ListTile(
          leading: const Icon(Icons.contact_page_outlined),
          title: const Text('Best Selling Report'),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).pushReplacementNamed(BestSelling.routeName);
          },
        ),
        ListTile(
          leading: const Icon(Icons.airline_seat_individual_suite_outlined),
          title: const Text('Near Expiry'),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context)
                .pushReplacementNamed(NearExpiryScreen.routeName);
          },
        ),
        ListTile(
          leading: const Icon(Icons.edit_document),
          title: const Text('Week-on-week'),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).pushReplacementNamed(WeekOnWeek.routeName);
          },
        ),
        ListTile(
          leading: const Icon(Icons.checklist),
          title: const Text('Month-on-month'),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).pushReplacementNamed(MonthOnMonth.routeName);
          },
        ),
        ListTile(
          leading: const Icon(Icons.contact_page_outlined),
          title: const Text('Year-on-Year'),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).pushReplacementNamed(YearOnYear.routeName);
          },
        ),
        ListTile(
          leading: const Icon(Icons.edit_document),
          title: const Text('Low Stock'),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context)
                .pushReplacementNamed(LowStockReportScreen.routeName);
          },
        ),
        ListTile(
          leading: const Icon(Icons.checklist),
          title: const Text('Platform used'),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context)
                .pushReplacementNamed(PlatformUsedScreen.routeName);
          },
        ),
        ListTile(
          leading: const Icon(Icons.contact_page_outlined),
          title: const Text('Promo products purchased'),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        ListTile(
          leading: const Icon(Icons.edit_document),
          title: const Text('Sell through rate'),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        ListTile(
          leading: const Icon(Icons.checklist),
          title: const Text('ABC Analysis'),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        ListTile(
          leading: const Icon(Icons.contact_page_outlined),
          title: const Text('Top Products by Revenue'),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text('Log Out'),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
