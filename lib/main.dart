import 'package:flutter/material.dart';
import 'package:food_delivery_test/route/route.gr.dart';

import 'di/locator.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

final _appRouter = AppRouter();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser());
  }
}
