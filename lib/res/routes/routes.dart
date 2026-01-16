import 'package:flutter/material.dart';
import 'package:httyd/screens/confirm_license_image.dart';
import 'package:httyd/screens/digital_copy.dart';
import 'package:httyd/screens/select_your_dragon.dart';
import 'package:httyd/screens/select_viking_name.dart';
import 'package:httyd/screens/splash/splash_screen.dart';
import 'package:httyd/screens/starting_page.dart';
import 'package:httyd/screens/thank_you_screen.dart';

class RouteNames {
  static const String splashScreen = 'splash_screen';
  static const String selectYourDragon = 'select_your_dragon';
  static const String selectVikingName = 'select_viking_name';
  static const String startingPage = 'starting_page';
  static const String confirmLicenseImage = 'confirm_license_image';
  static const String digitalCopy = 'digital_copy';
  static const String thankYouScreen = 'thank_you_screen';
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
      case RouteNames.selectVikingName:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SelectVikingName(),
        );
      case RouteNames.startingPage:
        return MaterialPageRoute(
          builder: (BuildContext context) => const StartingPage(),
        );
      case RouteNames.confirmLicenseImage:
        return MaterialPageRoute(
          builder: (BuildContext context) => const ConfirmLicenseImage(),
        );
      case RouteNames.digitalCopy:
        return MaterialPageRoute(
          builder: (BuildContext context) => const DigitalCopy(),
        );
      case RouteNames.thankYouScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => const ThankYouScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (BuildContext context) =>
              const Center(child: Text('No Route Defined')),
        );
    }
  }
}
