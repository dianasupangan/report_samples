import 'package:flutter/material.dart';
import 'package:report_samples/data/platform_used_data.dart.dart';

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
            label: Text('User'),
          ),
          DataColumn(
            label: Text('Platform'),
          ),
        ],
        rows: _createRows());
  }

  List<DataRow> _createRows() {
    List<DataRow> row = [];

    for (var items in platformUsed) {
      row.add(DataRow(cells: [
        DataCell(Text(items["username"])),
        DataCell(Text(items["platform_used"])),
      ]));
    }

    return row;
  }
}
