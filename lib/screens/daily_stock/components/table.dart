import 'package:flutter/material.dart';
import 'package:report_samples/data/daily_stock_data.dart';

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
            label: Text('Opening Stock'),
          ),
          DataColumn(
            label: Text('Closing Stock'),
          ),
          DataColumn(
            label: Text('Sold Stock'),
          ),
        ],
        rows: _createRows());
  }

  List<DataRow> _createRows() {
    List<DataRow> row = [];

    for (var items in dailyStock) {
      row.add(DataRow(cells: [
        DataCell(Text(items["item"])),
        DataCell(Text(items["description"])),
        DataCell(Text(items["opening_stock"])),
        DataCell(Text(items["closing_stock"])),
        DataCell(Text(items["sold_stock"])),
      ]));
    }

    return row;
  }
}
