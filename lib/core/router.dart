// [ This is an auto generated file ]

import 'package:flutter/material.dart';
import 'package:jaldi/core/router_constants.dart';

import 'package:jaldi/views/login_screen/login_screen_view.dart' as view0;

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginScreenViewRoute:
        return MaterialPageRoute(builder: (_) => view0.LoginScreenView());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
