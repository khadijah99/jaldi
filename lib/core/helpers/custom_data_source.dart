import 'package:flutter/material.dart';

class CustomDataSource extends DataTableSource {
  final List<DataRow> dataRows;

  // Constructor for CustomDataSource
  CustomDataSource(this.dataRows);

  // Retrieve a DataRow at a given index
  @override
  DataRow? getRow(int index) {
    if (index >= dataRows.length) {
      return null; // Return null if the index is out of range
    }
    return dataRows[index]; // Return the DataRow at the specified index
  }

  // Indicates whether the row count is an approximate value
  @override
  bool get isRowCountApproximate => false;

  // Get the total number of rows in the data source
  @override
  int get rowCount => dataRows.length;

  // Get the count of selected rows (not used in this implementation)
  @override
  int get selectedRowCount => 0;
}
