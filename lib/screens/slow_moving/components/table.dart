import 'package:flutter/material.dart';
import 'package:report_samples/data/slow_moving_data.dart';

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
        columns: [
          DataColumn(
            label: Text('Item'),
          ),
          DataColumn(
            label: Text('Descripition'),
          ),
          DataColumn(
            label: Text('Date Received'),
          ),
          DataColumn(
            label: Text('Sold Stock'),
          ),
          DataColumn(
            label: Text('Days Stock Kept'),
          ),
        ],
        rows: _createRows());
  }

  List<DataRow> _createRows() {
    List<DataRow> row = [];

    for (var items in slowMovingData) {
      row.add(DataRow(cells: [
        DataCell(Text(items["item"])),
        DataCell(Text(items["description"])),
        DataCell(Text(items["date_stock_received"])),
        DataCell(Text(items["sold_stock"])),
        DataCell(Text(items["days_stock_kept"])),
      ]));
    }

    return row;
  }
}
