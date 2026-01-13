import 'package:flutter/material.dart';
import 'package:httyd/res/constants/constants.dart';
import 'package:httyd/res/constants/media_constants.dart';
import 'package:httyd/res/theme/theme.dart';

class SelectYourDragon extends StatefulWidget {
  const SelectYourDragon({super.key});

  @override
  State<SelectYourDragon> createState() => _SelectYourDragonState();
}

class _SelectYourDragonState extends State<SelectYourDragon> {
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
                  MediaConstants.paperBackground,
                  fit: BoxFit.fitHeight,
                ),
                Positioned(
                  top: 160,
                  left: 100,
                  child: Image.asset(
                    width: 800,
                    MediaConstants.lineDecoration,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Positioned(
                  top: 145,
                  right: 160,
                  child: Image.asset(
                    width: 35,
                    MediaConstants.circle,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Positioned(
                  top: 145,
                  right: 220,
                  child: Image.asset(
                    width: 35,
                    MediaConstants.circle,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Positioned(
                  top: 145,
                  right: 100,
                  child: Image.asset(
                    width: 35,
                    MediaConstants.circle,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Positioned(
                  top: 200,
                  left: 0,
                  right: 0,
                  child: Text(
                    "DragonRiding",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 170,
                      fontFamily: Constants.fontPiecesOfEight,
                      color: CustomColors.darkPrimaryTextColor.withAlpha(220),
                    ),
                  ),
                ),
                Positioned(
                  top: 350,
                  left: 0,
                  right: 0,
                  child: Text(
                    "License",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 170,
                      letterSpacing: 0,
                      height: 0,
                      fontFamily: Constants.fontPiecesOfEight,
                      color: CustomColors.darkPrimaryTextColor.withAlpha(220),
                    ),
                  ),
                ),
                Positioned(
                  top: 80,
                  left: 100,
                  right: 100,
                  child: Image.asset(MediaConstants.isleOfBerk, height: 45),
                ),
                Positioned(
                  bottom: 120,
                  left: 100,
                  child: Container(
                    child: Image.asset(
                      MediaConstants.bottomLeftDarkBgEffect,
                      width: 150,
                      height: 70,
                    ),
                  ),
                ),
                Positioned(
                  top: 455,
                  left: 170,
                  child: Image.asset(
                    MediaConstants.leftDarkBgEffect,
                    width: 50,
                    height: 650,
                  ),
                ),
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 60,
                  child: Image.asset(
                    MediaConstants.isleOfBerkVertical,
                    width: 50,
                  ),
                ),
                Positioned(
                  top: 30,
                  right: 30,
                  child: Image.asset(
                    MediaConstants.topRightDarkBgEffect,
                    width: 130,
                    height: 280,
                  ),
                ),

                Positioned(
                  top: 882,
                  left: 428,
                  right: 428,
                  child: MaterialButton(
                    padding: EdgeInsets.symmetric(vertical: 25),
                    color: CustomColors.buttonColor.withOpacity(0.95),
                    onPressed: () {},
                    child: Text(
                      "START",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        fontFamily: Constants.fontAdornExpandedSans,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
