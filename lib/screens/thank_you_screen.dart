import 'dart:async';
import 'package:flutter/material.dart';
import 'package:httyd/res/constants/media_constants.dart';
import 'package:httyd/utils/responsiveSize.dart';

class ThankYouScreen extends StatefulWidget {
  final VoidCallback? onReset;
  
  const ThankYouScreen({super.key, this.onReset});

  @override
  State<ThankYouScreen> createState() => _ThankYouScreenState();
}

class _ThankYouScreenState extends State<ThankYouScreen> {
  Timer? _resetTimer;

  @override
  void initState() {
    super.initState();
    // Start timer to reset after 10 seconds
    _resetTimer = Timer(const Duration(seconds: 10), () {
      if (mounted && widget.onReset != null) {
        widget.onReset!();
      }
    });
  }

  @override
  void dispose() {
    _resetTimer?.cancel();
    super.dispose();
  }

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
