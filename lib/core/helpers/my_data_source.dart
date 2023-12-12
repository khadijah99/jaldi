import 'package:flutter/material.dart';

class MyDataSource extends DataTableSource {
  static const List<int> _displayIndexToRawIndex = <int>[0, 3, 4, 5, 6];

  late List<List<Comparable<Object>>> sortedData;
  void setData(List<List<Comparable<Object>>> rawData, int sortColumn,
      bool sortAscending) {
    sortedData = rawData.toList()
      ..sort((List<Comparable<Object>> a, List<Comparable<Object>> b) {
        final Comparable<Object> cellA = a[_displayIndexToRawIndex[sortColumn]];
        final Comparable<Object> cellB = b[_displayIndexToRawIndex[sortColumn]];
        return cellA.compareTo(cellB) * (sortAscending ? 1 : -1);
      });
    notifyListeners();
  }

  @override
  int get rowCount => sortedData.length;

  static DataCell cellFor(Object data) {
    String value;
    if (data is DateTime) {
      value =
          '${data.year}-${data.month.toString().padLeft(2, '0')}-${data.day.toString().padLeft(2, '0')}';
    } else {
      value = data.toString();
    }
    return DataCell(Text(value));
  }

  @override
  DataRow? getRow(int index) {
    return DataRow.byIndex(
      index: sortedData[index][0] as int,
      cells: <DataCell>[
        cellFor(
            'S${sortedData[index][1]}E${sortedData[index][2].toString().padLeft(2, '0')}'),
        cellFor(sortedData[index][3]),
        cellFor(sortedData[index][4]),
        cellFor(sortedData[index][5]),
        cellFor(sortedData[index][6]),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
