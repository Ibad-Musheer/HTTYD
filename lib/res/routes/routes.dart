import 'package:flutter/material.dart';
import 'package:httyd/screens/select_your_dragon.dart';
import 'package:httyd/screens/splash/splash_screen.dart';
import 'package:httyd/screens/starting_page.dart';

class RouteNames {
  static const String splashScreen = 'splash_screen';
  static const String selectYourDragon = 'select_your_dragon';
  static const String startingPage = 'starting_page';
}

class Routes {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteNames.splashScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SplashScreen(),
        );
      case RouteNames.selectYourDragon:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SelectYourDragon(),
        );
      case RouteNames.startingPage:
        return MaterialPageRoute(
          builder: (BuildContext context) => const StartingPage(),
        );
      default:
        return MaterialPageRoute(
          builder: (BuildContext context) =>
              const Center(child: Text('No Route Defined')),
        );
    }
  }
}
