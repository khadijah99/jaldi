import 'package:flutter/material.dart';
import 'package:jaldi/core/services/api_service.dart';

import '../locator.dart';
import '../models/leads.dart';

class LeadsProvider extends ChangeNotifier {
  final JaldiApiService _apiService = locator<JaldiApiService>();

  late Leads? leads;
  bool isLoading = false;

  bool _sortAscending = true;
  String? _sortedColumn;

  // Getter for sortedColumn
  String? get sortedColumn => _sortedColumn;

  // Getter for sortAscending
  bool get sortAscending => _sortAscending;

  LeadsProvider({this.leads});

  Leads? getLeadsData() {
    return leads;
  }

  Future<void> fetchLeads(
      {bool isMock = true, int pageNo = 1, String? sortBy}) async {
    isLoading = true;
    final response = await _apiService.getLeads(
        endpoint: '', isMock: isMock, pageNo: pageNo);
    leads = response;
    if (sortBy != null) {
      if (leads?.leads != null) {
        leads!.leads!.sort((a, b) {
          dynamic aValue = _getValueForSorting(a, sortBy);
          dynamic bValue = _getValueForSorting(b, sortBy);

          if (aValue is String && bValue is String) {
            return aValue.compareTo(bValue);
          } else {
            return Comparable.compare(aValue, bValue);
          }
        });
      }
    }
    isLoading = false;
    notifyListeners();
  }

  void toggleSort(String column) {
    if (_sortedColumn == column) {
      _sortAscending = !_sortAscending;
    } else {
      _sortedColumn = column;
      _sortAscending = true;
    }

    // Fetch leads with sorting parameters
    fetchLeads(sortBy: _sortedColumn);
  }

  dynamic _getValueForSorting(InnerLeadData lead, String sortBy) {
    switch (sortBy) {
      case 'firstName':
        return lead.firstName;
      case 'lastName':
        return lead.lastName;
      case 'phone':
        return lead.phone;
      case 'email':
        return lead.email;
      case 'source':
        return lead.source;
      case 'campaign':
        return lead.campaignName;
      case 'agentName':
        return lead.agentName;
      case 'lastUpdated':
        return lead.dateUpdated;
      default:
        return '';
    }
  }
}
