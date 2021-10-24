import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:knowledgebase/bloc/api_caller_classes/get_all_result.dart';
import 'package:knowledgebase/bloc/api_caller_classes/get_quick_links.dart';
import 'package:knowledgebase/bloc/providers_list/app_providers.dart';
import 'package:knowledgebase/bloc/theme_classes/dark_theme_styles.dart';
import 'package:knowledgebase/bloc/theme_classes/darkmode_provider.dart';
import 'package:knowledgebase/router/routing.dart';
import 'package:provider/provider.dart';
import 'package:routemaster/routemaster.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());
  runApp(const AppProviders(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return Consumer3(builder: (_, DarkModeSwitcher darkModeSwitcher,
        GetArticle getArticle, GetQuickLinks getQuickLinks, __) {
      return MaterialApp.router(
        routerDelegate: RoutingMap.routeDelegate,
        routeInformationParser: const RoutemasterParser(),
        scrollBehavior: AppScrollBehavior(),
        debugShowCheckedModeBanner: false,
        title: 'Knowledge Base',
        theme: Styles.themeData(darkModeSwitcher.isDarkMode, context),
      );
    });
  }
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
