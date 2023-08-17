import 'package:flutter/material.dart';
import 'package:report_samples/data/promotion_data.dart';
import 'package:report_samples/data/sell_through.dart';

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
            label: Text('Stock Delivered'),
          ),
          DataColumn(
            label: Text('Percent of Stock Sold'),
          ),
          DataColumn(
            label: Text('Sold Stock'),
          ),
        ],
        rows: _createRows());
  }

  List<DataRow> _createRows() {
    List<DataRow> row = [];

    for (var items in sellThrough) {
      row.add(DataRow(cells: [
        DataCell(Text(items["item"])),
        DataCell(Text(items["description"])),
        DataCell(Text(items["stock_delivered"])),
        DataCell(Text(items["percent"])),
        DataCell(Text(items["sold_stock"])),
      ]));
    }

    return row;
  }
}
