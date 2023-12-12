import 'package:flutter/material.dart';

class CustomDataSource extends DataTableSource {
  final List<DataRow> dataRows;

  CustomDataSource(this.dataRows);

  @override
  DataRow? getRow(int index) {
    if (index >= dataRows.length) {
      return null;
    }
    return dataRows[index];
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => dataRows.length;

  @override
  int get selectedRowCount => 0;
}
