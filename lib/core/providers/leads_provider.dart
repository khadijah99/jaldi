import 'package:flutter/material.dart';
import 'package:jaldi/core/services/api_service.dart';

import '../locator.dart';
import '../models/leads.dart';

class LeadsProvider extends ChangeNotifier {
  final JaldiApiService _apiService = locator<JaldiApiService>();

  // Holds the leads data
  late Leads? leads;

  // Flag indicating loading state
  bool isLoading = false;

  // Flag to manage sorting
  bool _sortAscending = true;
  String? _sortedColumn;

  // Getter for sortedColumn
  String? get sortedColumn => _sortedColumn;

  // Getter for sortAscending
  bool get sortAscending => _sortAscending;

  // Constructor for LeadsProvider
  LeadsProvider({this.leads});

  // Getter method to access leads data
  Leads? getLeadsData() {
    return leads;
  }

  // Method to fetch leads with optional sorting
  Future<void> fetchLeads(
      {bool isMock = true, int pageNo = 1, String? sortBy}) async {
    isLoading = true; // Set loading flag to true
    final response = await _apiService.getLeads(
      endpoint: '', // API endpoint for fetching leads
      isMock: isMock,
      pageNo: pageNo,
    );
    leads = response; // Store the fetched leads data

    if (sortBy != null) {
      if (leads?.leads != null) {
        // Sort the leads based on the provided column
        leads!.leads!.sort((a, b) {
          dynamic aValue = _getValueForSorting(a, sortBy);
          dynamic bValue = _getValueForSorting(b, sortBy);

          // Compare the values for sorting
          if (aValue is String && bValue is String) {
            return aValue.compareTo(bValue);
          } else {
            return Comparable.compare(aValue, bValue);
          }
        });
      }
    }

    isLoading = false; // Set loading flag to false
    notifyListeners(); // Notify listeners about the change in state
  }

  // Method to toggle sorting order for a column
  void toggleSort(String column) {
    if (_sortedColumn == column) {
      _sortAscending = !_sortAscending; // Reverse the sorting order
    } else {
      _sortedColumn = column; // Set the sorted column
      _sortAscending = true; // Set the sorting order to ascending
    }

    // Fetch leads with updated sorting parameters
    fetchLeads(sortBy: _sortedColumn);
  }

  // Method to get the value of a specific field for sorting
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
