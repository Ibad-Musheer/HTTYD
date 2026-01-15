import 'package:flutter/material.dart';
import 'package:httyd/res/constants/constants.dart';
import 'package:httyd/res/constants/media_constants.dart';
import 'package:httyd/res/routes/routes.dart';
import 'package:httyd/res/theme/theme.dart';
import 'package:httyd/utils/responsiveSize.dart';

class SelectVikingName extends StatefulWidget {
  const SelectVikingName({super.key});

  @override
  State<SelectVikingName> createState() => _SelectVikingNameState();
}

class _SelectVikingNameState extends State<SelectVikingName> {
  int? selectedFirstNameIndex;
  int? selectedLastNameIndex;

  List<String> vikingFirstNames = [
    "FIRST",
    "FIRST",
    "FIRST",
    "FIRST",
    "FIRST",
    "FIRST",
    "FIRST",
    "FIRST",
    "FIRST",
    "FIRST",
  ];

  List<String> vikingLastNames = [
    "LAST",
    "LAST",
    "LAST",
    "LAST",
    "LAST",
    "LAST",
    "LAST",
    "LAST",
    "LAST",
    "LAST",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: context.screenWidth,
        height: context.screenHeight,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(MediaConstants.selectVikingNameBg),
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 750),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: vikingFirstNames.asMap().entries.map((entry) {
                    final index = entry.key;
                    final name = entry.value;
                    final isSelected = selectedFirstNameIndex == index;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedFirstNameIndex = index;
                        });
                      },
                      child: SizedBox(
                        height: 70,
                        width: 250,
                        child: Stack(
                          children: [
                            if (isSelected)
                              Image.asset(
                                MediaConstants.selectedFirstName,
                                height: 80,
                                width: 250,
                              ),
                            Positioned(
                              right: 20,
                              left: 60,
                              top: 5,
                              child: Text(
                                name,
                                style: TextStyle(
                                  fontSize: 50,
                                  fontFamily: Constants.fontScribblesJE,
                                  color: Color(0xff3f362a),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: vikingLastNames.asMap().entries.map((entry) {
                    final index = entry.key;
                    final name = entry.value;
                    final isSelected = selectedLastNameIndex == index;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedLastNameIndex = index;
                        });
                      },
                      child: SizedBox(
                        height: 70,
                        width: 250,
                        child: Stack(
                          children: [
                            if (isSelected)
                              Image.asset(
                                MediaConstants.selectedLastName,
                                height: 80,
                                width: 250,
                              ),
                            Positioned(
                              right: 40,
                              top: 5,
                              child: Text(
                                name,
                                style: TextStyle(
                                  fontSize: 50,
                                  fontFamily: Constants.fontScribblesJE,
                                  color: Color(0xff3f362a),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
            SizedBox(height: 240),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, RouteNames.confirmLicenseImage);
              },
              child: Container(
                height: 110,
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                    image: AssetImage(MediaConstants.border),
                    fit: BoxFit.contain,
                    opacity: 0.6,
                  ),
                ),
                child: Center(
                  child: Text(
                    "Confirm",
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: Constants.fontAdornExpandedSans,
                      color: CustomColors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
