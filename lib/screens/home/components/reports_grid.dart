import 'package:flutter/material.dart';

class ReportsGrid extends StatefulWidget {
  const ReportsGrid({super.key});

  @override
  State<ReportsGrid> createState() => _ReportsGridState();
}

class _ReportsGridState extends State<ReportsGrid> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: <TableRow>[
          TableRow(
            children: <Widget>[
              Card(
                child: Container(
                  child: const Text("Hi"),
                ),
              ),
              Card(
                child: Container(
                  child: Text("Hi"),
                ),
              ),
              Card(
                child: Container(
                  child: Text("Hi"),
                ),
              ),
            ],
          ),
          TableRow(
            children: <Widget>[
              Card(
                child: Container(
                  child: Text("Hi"),
                ),
              ),
              Center(
                child: Container(
                  width: 70,
                  child: Card(
                    child: Container(
                      child: Text("Hi"),
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  child: Card(
                    child: Container(
                      child: Text("Hi"),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
