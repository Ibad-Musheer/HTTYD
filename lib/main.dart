import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:httyd/l10n/app_localizations.dart';
import 'package:httyd/l10n/l10n.dart';
import 'package:httyd/res/constants/constants.dart';
import 'package:httyd/res/routes/routes.dart';
import 'package:httyd/res/theme/theme.dart';
import 'package:httyd/screens/starting_page.dart';
import 'package:httyd/utils/utils.dart';

void main() {
  final bladeDevice = DeviceInfo.genericTablet(
    platform: TargetPlatform.android,
    id: 's11ultra',
    name: 'S11 Ultra',
    screenSize: const Size(1848, 2690),
    pixelRatio: 2,
  );

  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky).then(
    (_) => runApp(
      DevicePreview(
        enabled: false,
        defaultDevice: bladeDevice,
        devices: [bladeDevice],
        backgroundColor: Colors.grey,
        builder: (context) => MyApp(),
        tools: const [DeviceSection()],
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: Utils.scaffoldMessengerKey,
      title: Constants.appName,
      initialRoute: RouteNames.startingPage,
      onGenerateRoute: Routes.generateRoute,
      themeMode: ThemeMode.light,
      theme: lightTheme,
      darkTheme: darkTheme,
      locale: const Locale('en'),
      supportedLocales: L10n.all,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        // GlobalMaterialLocalizations.delegate,
        // GlobalWidgetsLocalizations.delegate,
        // GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
