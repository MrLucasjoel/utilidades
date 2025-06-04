import 'package:flutter/material.dart';

Map<String, Widget> generateRoutes() {
  final Map<String, WidgetBuilder> routes = {};

  for(var item in appMenuItems) {
    routes[item.route] = 
      (context) => BaseLayout();
  }

  return routes;
}