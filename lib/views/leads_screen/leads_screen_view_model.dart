import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:jaldi/core/logger.dart';

class LeadsScreenViewModel extends BaseViewModel {
  late Logger log;
  PageController pageController = PageController();
  SideMenuController sideMenu = SideMenuController();
  TextEditingController searchController = TextEditingController();
  SideMenuDisplayMode mode = SideMenuDisplayMode.compact;

  toggleSideMenuDisplayMode() {
    if (mode == SideMenuDisplayMode.compact)
      mode = SideMenuDisplayMode.open;
    else
      mode = SideMenuDisplayMode.compact;
    notifyListeners();
  }

  LeadsScreenViewModel() {
    log = getLogger(runtimeType.toString());
  }
}
