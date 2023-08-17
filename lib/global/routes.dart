import 'package:flutter/widgets.dart';
import 'package:report_samples/screens/abc_analysis/abc_analysis_screen.dart';
import 'package:report_samples/screens/best_selling/best_selling_screen.dart';
import 'package:report_samples/screens/daily_stock/daily_stock_screen.dart';
import 'package:report_samples/screens/low_stock/low_stock_screen.dart';
import 'package:report_samples/screens/month_on_month/month_on_month_screen.dart';
import 'package:report_samples/screens/near_expiry/new_expiry_screen.dart';
import 'package:report_samples/screens/promotion/promotion_report.dart';
import 'package:report_samples/screens/sell_through/sell_through_screen.dart';
import 'package:report_samples/screens/slow_moving/slow_moving_screen.dart';
import 'package:report_samples/screens/stock_cost_report/stock_cost_report_screen.dart';
import 'package:report_samples/screens/top_products_revenue/top_products_revenue_screen.dart';
import 'package:report_samples/screens/week_on_week/week_on_week_screen.dart';
import 'package:report_samples/screens/year_on_year/year_on_year_screen.dart';

import '../screens/home/home_screen.dart';
import '../screens/platform_used/platform_used_screen.dart';

final Map<String, WidgetBuilder> routes = {
  "/": (ctx) => const HomeScreen(),
  StockCostReportScreen.routeName: (ctx) => const StockCostReportScreen(),
  DailyStockReportScreen.routeName: (ctx) => const DailyStockReportScreen(),
  SlowMovingScreen.routeName: (ctx) => const SlowMovingScreen(),
  BestSelling.routeName: (ctx) => const BestSelling(),
  NearExpiryScreen.routeName: (ctx) => const NearExpiryScreen(),
  WeekOnWeek.routeName: (ctx) => const WeekOnWeek(),
  MonthOnMonth.routeName: (ctx) => const MonthOnMonth(),
  YearOnYear.routeName: (ctx) => const YearOnYear(),
  LowStockReportScreen.routeName: (ctx) => const LowStockReportScreen(),
  PlatformUsedScreen.routeName: (ctx) => const PlatformUsedScreen(),
  PromotionReport.routeName: (ctx) => const PromotionReport(),
  SellThroughReport.routeName: (ctx) => const SellThroughReport(),
  ABCAnalysishReport.routeName: (ctx) => const ABCAnalysishReport(),
  TopProductsRevenue.routeName: (ctx) => const TopProductsRevenue(),
};
