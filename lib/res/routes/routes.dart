import 'package:flutter/material.dart';
import 'package:httyd/screens/splash/splash_screen.dart';

class RouteNames {
  static const String splashScreen = 'splash_screen';
}

class Routes {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteNames.splashScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashScreen());

      default:
        return MaterialPageRoute(
          builder: (BuildContext context) => const Center(
            child: Text('No Route Defined'),
          ),
        );
    }
  }
}
