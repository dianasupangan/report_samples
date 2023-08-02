import 'package:flutter/material.dart';

import 'global/routes.dart';
import 'screens/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Report Samples",
      theme: ThemeData(
        primaryColor: Colors.green,
        appBarTheme: AppBarTheme(color: Color.fromARGB(255, 137, 171, 100)),
        scaffoldBackgroundColor: Colors.white,
        cardTheme: CardTheme(
          color: Color.fromARGB(255, 236, 242, 229),
          elevation: 10,
        ),
      ),
      initialRoute: "/",
      routes: routes,
    );
  }
}
