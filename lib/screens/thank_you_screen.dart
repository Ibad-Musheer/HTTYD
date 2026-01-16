import 'package:flutter/material.dart';
import 'package:httyd/res/constants/media_constants.dart';
import 'package:httyd/utils/responsiveSize.dart';

class ThankYouScreen extends StatefulWidget {
  const ThankYouScreen({super.key});

  @override
  State<ThankYouScreen> createState() => _ThankYouScreenState();
}

class _ThankYouScreenState extends State<ThankYouScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: context.screenWidth,
        height: context.screenHeight,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(MediaConstants.thankYouBg)),
        ),
        child: Stack(children: [
          ],
        ),
      ),
    );
  }
}
