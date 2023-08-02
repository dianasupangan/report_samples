import 'package:flutter/material.dart';
import 'package:report_samples/data/near_expiry.dart';

class ReportTable extends StatefulWidget {
  const ReportTable({super.key});

  @override
  State<ReportTable> createState() => _ReportTableState();
}

class _ReportTableState extends State<ReportTable> {
  @override
  Widget build(BuildContext context) {
    return DataTable(columns: [
      DataColumn(
        label: Text('Item'),
      ),
      DataColumn(
        label: Text('Descripition'),
      ),
      DataColumn(
        label: Text('Expiration Date'),
      ),
      DataColumn(
        label: Text('Days Before Expiration'),
      ),
    ], rows: _createRows());
  }

  List<DataRow> _createRows() {
    List<DataRow> row = [];

    for (var items in nearExpiryData) {
      row.add(DataRow(cells: [
        DataCell(Text(items["item"])),
        DataCell(Text(items["description"])),
        DataCell(Text(items["expiration_date"])),
        DataCell(Text(items["days_before_expiration"])),
      ]));
    }

    return row;
  }
}
