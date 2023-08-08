import 'package:flutter/material.dart';
import 'package:report_samples/data/near_expiry_data.dart';
import 'package:report_samples/data/wow_data.dart';

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
            label: Text('Date'),
          ),
          DataColumn(
            label: Text('Total Sold'),
          ),
        ],
        rows: _createRows());
  }

  List<DataRow> _createRows() {
    List<DataRow> row = [];

    for (var items in weekOnWeek) {
      row.add(DataRow(cells: [
        DataCell(Text(items["item"])),
        DataCell(Text(items["description"])),
        DataCell(Text(items["date"])),
        DataCell(Text(items["sold_stock"])),
      ]));
    }

    return row;
  }
}
