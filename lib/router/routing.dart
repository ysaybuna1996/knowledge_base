// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:knowledgebase/pages/homepage.dart';
import 'package:knowledgebase/router/routing_observers.dart';
import 'package:routemaster/routemaster.dart';

class RoutingMap {
  static final GlobalKey<ScaffoldState> scaffKey = GlobalKey();
  static final routeDelegate = RoutemasterDelegate(
      observers: [RoutingObserver()], routesBuilder: (_) => routes);

  static final routes = RouteMap(onUnknownRoute: (_) => Redirect('/'), routes: {
    '/': (route) => MaterialPage(
            child: HomePage(
          kbId: "null",
        )),
    '/article/:kbId': (routes) =>
        MaterialPage(child: HomePage(kbId: routes.pathParameters['kbId']!)),
  });
}
