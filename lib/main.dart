import 'package:flutter/material.dart';
import 'package:jaldi/core/providers/authentication_provider.dart';
import 'package:jaldi/core/providers/leads_provider.dart';
import 'package:jaldi/views/leads_screen/leads_screen_view.dart';
import 'package:jaldi/views/login_screen/login_screen_view.dart';
import 'package:provider/provider.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:vrouter/vrouter.dart';

import 'core/locator.dart';
import 'core/router_constants.dart';
import 'core/router.dart' as router;

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
            create: (_) => AuthenticationProvider()),
        ChangeNotifierProvider<LeadsProvider>(create: (_) => LeadsProvider()),
      ],
      child: VRouter(
          mode: VRouterMode.history,
          debugShowCheckedModeBanner: false,
          routes: [
            VGuard(
              beforeEnter: (vRedirector) async {
                final isLoggedIn = authProvider.user != null;
                // Check if the user is logged in
                if (!isLoggedIn) {
                  // If not, redirect to /login
                  vRedirector.to('/login');
                }
              },
              stackedRoutes: [],
            ),
            VWidget(
              path: '/',
              widget: LeadsScreenView(),
            ),
            VWidget(
              path: '/leads',
              widget: LeadsScreenView(),
            ),
            //Wrong page route and wildcard route redirect

            VWidget(path: "/login", widget: LoginScreenView()),

            //-----------------------ALL of the blog posts------------------

            // VWidget(
            //   path: '/blog/post-1',
            //   widget: const UniqueBlogPageLayout(post: BlogPosts.BlogPost1),
            // ),
            // VWidget(
            //   path: '/blog/post-2',
            //   widget: const UniqueBlogPageLayout(post: BlogPosts.BlogPost1),
            // ),

            // //-----------------------ALL of the project posts------------------

            // VWidget(
            //   path: '/projects/project-1',
            //   widget:
            //       const UniqueProjectPageLayout(post: ProjectPosts.ProjectPost1),
            // ),
            // VWidget(
            //   path: '/projects/project-2',
            //   widget:
            //       const UniqueProjectPageLayout(post: ProjectPosts.ProjectPost2),
            // ),

            VRouteRedirector(path: '*', redirectTo: '/404')
          ],
          title: 'Jaldi',
          theme: ThemeData(
            fontFamily: 'Helvetica',
            primarySwatch: Colors.grey,
          )),
      // MaterialApp(
      //   navigatorKey: locator<NavigationService>().navigatorKey,
      //   onGenerateRoute: router.Router.generateRoute,
      //   debugShowCheckedModeBanner: false,
      //   initialRoute: leadsScreenViewRoute,
      // ),
    );
  }
}
