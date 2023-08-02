import 'package:flutter/material.dart';
import 'package:report_samples/data/stock_cost_data.dart';

class ReportTable extends StatefulWidget {
  const ReportTable({super.key});

  @override
  State<ReportTable> createState() => _ReportTableState();
}

class _ReportTableState extends State<ReportTable> {
  @override
  Widget build(BuildContext context) {
    return DataTable(
        headingRowColor:
            MaterialStateProperty.all(const Color.fromARGB(255, 236, 242, 229)),
        columns: const [
          DataColumn(
            label: Text('Item'),
          ),
          DataColumn(
            label: Text('Descripition'),
          ),
          DataColumn(
            label: Text('On Hand Qty'),
          ),
          DataColumn(
            label: Text('Unit Cost'),
          ),
          DataColumn(
            label: Text('Total Cost'),
          ),
        ],
        rows: _createRows());
  }

  List<DataRow> _createRows() {
    List<DataRow> row = [];

    for (var items in stockCostData) {
      row.add(DataRow(cells: [
        DataCell(Text(items["item"]!)),
        DataCell(Text(items["description"]!)),
        DataCell(Text(items["on_hand_qty"]!)),
        DataCell(Text(items["unit_cost"]!)),
        DataCell(Text(items["total_cost"]!)),
      ]));
    }

    return row;
  }
}
