import 'package:flutter/material.dart';
import 'package:httyd/res/theme/theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            CustomColors.gradientTop,
            CustomColors.gradientMiddle,
            CustomColors.gradientBottom,
          ])),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Pambuddy",
            style: Theme.of(context)
                .textTheme
                .displayLarge
                ?.copyWith(color: CustomColors.white),
          ),
          
        ],
      ),
    );
  }
}
