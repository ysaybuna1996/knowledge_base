import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

class RoutingObserver extends RoutemasterObserver {
  // RoutemasterObserver extends NavigatorObserver and
  // receives all nested Navigator events
  @override
  void didPop(Route route, Route? previousRoute) {
    debugPrint('Popped a route');
  }

  // Routemaster-specific observer method
  @override
  void didChangeRoute(RouteData routeData, Page page) {
    debugPrint('New route: ${routeData.path}');
  }
}
