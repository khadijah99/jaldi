import 'package:flutter/material.dart';
import 'package:flutter_side_menu/flutter_side_menu.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:jaldi/core/logger.dart';

import '../../core/providers/leads_provider.dart';

class LeadsScreenViewModel extends BaseViewModel {
  late Logger log;
  PageController pageController = PageController();
  int currentPage = 1;

  TextEditingController searchController = TextEditingController();
  SideMenuMode mode = SideMenuMode.open;
  SideMenuController sideMenuController = SideMenuController();

  double hideButtonWidth = 15;
  MainAxisAlignment rowAllignment = MainAxisAlignment.spaceEvenly;

  toggleMenu() {
    hideButtonWidth = hideButtonWidth == 15 ? 36 : 15;
    mode = mode == SideMenuMode.open ? SideMenuMode.compact : SideMenuMode.open;
    rowAllignment = rowAllignment == MainAxisAlignment.spaceEvenly
        ? MainAxisAlignment.center
        : MainAxisAlignment.spaceEvenly;
    notifyListeners();
  }

  LeadsScreenViewModel(context) {
    Provider.of<LeadsProvider>(context, listen: false).fetchLeads(isMock: true);
    log = getLogger(runtimeType.toString());
  }
}
