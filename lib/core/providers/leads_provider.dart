import 'package:flutter/material.dart';
import 'package:jaldi/core/services/api_service.dart';

import '../locator.dart';
import '../models/leads.dart';

class LeadsProvider extends ChangeNotifier {
  final JaldiApiService _apiService = locator<JaldiApiService>();

  late Leads? leads;
  bool isLoading = false;

  LeadsProvider({this.leads});

  Leads? getLeadsData() {
    return leads;
  }

  Future<Leads?> fetchLeads({bool isMock = false}) async {
    final response = await _apiService.getLeads(endpoint: '', isMock: isMock);
    leads = response;
    return leads;
  }
}
