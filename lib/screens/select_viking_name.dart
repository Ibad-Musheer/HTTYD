import 'package:flutter/material.dart';
import 'package:httyd/res/constants/media_constants.dart';

class SelectVikingName extends StatefulWidget {
  const SelectVikingName({super.key});

  @override
  State<SelectVikingName> createState() => _SelectVikingNameState();
}

class _SelectVikingNameState extends State<SelectVikingName> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Stack(
              children: [
                Image.asset(
                  MediaConstants.selectVikingNameBg,
                  fit: BoxFit.fitHeight,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
