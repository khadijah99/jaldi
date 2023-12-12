import 'package:flutter/material.dart';
import 'package:jaldi/core/providers/authentication_provider.dart';
import 'package:jaldi/core/providers/leads_provider.dart';
import 'package:jaldi/views/leads_screen/leads_screen_view.dart';
import 'package:jaldi/views/login_screen/login_screen_view.dart';
import 'package:provider/provider.dart';
import 'package:vrouter/vrouter.dart';

import 'core/locator.dart';

void main() async {
  await LocatorInjector.setUpLocator();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  AuthenticationProvider authProvider = AuthenticationProvider();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthenticationProvider>(
          create: (_) => AuthenticationProvider(user: null),
        ),
        ChangeNotifierProvider<LeadsProvider>(create: (_) => LeadsProvider()),
      ],
      child: Builder(builder: (
        context,
      ) {
        return VRouter(
            mode: VRouterMode.history,
            debugShowCheckedModeBanner: false,
            routes: [
              VGuard(
                beforeEnter: (vRedirector) async {
                  final isLoggedIn = Provider.of<AuthenticationProvider>(
                              context,
                              listen: false)
                          .user !=
                      null;
                  print(isLoggedIn);
                  // Check if the user is logged in
                  if (!isLoggedIn) {
                    // If not, redirect to /login
                    vRedirector.to('/login');
                  }
                },
                stackedRoutes: [
                  VWidget(
                    path: '/leads',
                    widget: LeadsScreenView(),
                  ),
                ],
              ),
              VWidget(
                path: '/',
                widget: LoginScreenView(),
              ),

              //Wrong page route and wildcard route redirect

              VWidget(path: "/login", widget: LoginScreenView()),

              VRouteRedirector(path: '*', redirectTo: '/404')
            ],
            title: 'Jaldi',
            theme: ThemeData(
              fontFamily: 'Helvetica',
              primarySwatch: Colors.grey,
            ));
      }),
    );
  }
}
