import 'package:flutter/material.dart';
import 'package:flutter_onscreen_keyboard/flutter_onscreen_keyboard.dart';
import 'package:httyd/res/constants/constants.dart';
import 'package:httyd/res/constants/media_constants.dart';
import 'package:httyd/res/routes/routes.dart';
import 'package:httyd/res/theme/theme.dart';
import 'package:httyd/utils/responsiveSize.dart';

class DigitalCopy extends StatefulWidget {
  const DigitalCopy({super.key});

  @override
  State<DigitalCopy> createState() => _DigitalCopyState();
}

class _DigitalCopyState extends State<DigitalCopy> {
  TextEditingController emailController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      emailFocusNode.requestFocus();
    });
    emailFocusNode.addListener(() {
      if (!emailFocusNode.hasFocus) {
        emailFocusNode.requestFocus();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: OnscreenKeyboard.builder(
        showControlBar: false,
        width: (context) => 740,
        aspectRatio: 1.7,
        theme: OnscreenKeyboardThemeData(
          actionKeyThemeData: ActionKeyThemeData(
            backgroundColor: Colors.transparent,
            iconSize: 45,
          ),
          textKeyThemeData: TextKeyThemeData(
            backgroundColor: Colors.transparent,

            textStyle: TextStyle(
              fontSize: 20,
              fontFamily: Constants.fontAdornExpandedSans,
              color: CustomColors.black,
            ),
          ),
          margin: EdgeInsets.only(bottom: 548, left: 230, right: 200),
          color: Colors.transparent,
          controlBarColor: Colors.transparent,
        ),
      ),

      home: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          width: context.screenWidth,
          height: context.screenHeight,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(MediaConstants.digitalCopyBg),
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 550,
                left: 255,
                right: 220,
                child: Center(
                  child: Text(
                    "As your license prints enter your email to receive a digital copy",
                    style: TextStyle(
                      height: 0,
                      fontSize: 38,
                      fontFamily: Constants.fontAdornExpandedSans,
                      color: CustomColors.black,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 846,
                left: 57,
                child: Image.asset(
                  MediaConstants.isleOfBerkVertical,
                  height: 280,
                  width: 50,
                ),
              ),

              Positioned(
                top: 780,
                left: 255,
                right: 240,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 135,
                    alignment: Alignment.bottomCenter,
                    child: OnscreenKeyboardTextField(
                      controller: emailController,
                      focusNode: emailFocusNode,
                      textAlign: TextAlign.center,
                      enableOnscreenKeyboard: true, // default to true
                      onSubmitted: (_) {
                        emailFocusNode.unfocus();
                        emailFocusNode.requestFocus();
                      },
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: Constants.fontAdornExpandedSans,
                        color: CustomColors.black,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 375,
                left: 465,
                right: 450,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.digitalCopy);
                  },
                  child: SizedBox(
                    height: 105,
                    width: 550,
                    child: Center(
                      child: Text(
                        "CONFIRM",
                        style: TextStyle(
                          fontSize: 28,
                          fontFamily: Constants.fontAdornExpandedSans,
                          color: CustomColors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 220,
                left: 465,
                right: 450,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.digitalCopy);
                  },
                  child: SizedBox(
                    height: 105,
                    width: 550,
                    child: Center(
                      child: Text(
                        "NO, THANKS",
                        style: TextStyle(
                          fontSize: 28,
                          fontFamily: Constants.fontAdornExpandedSans,
                          color: CustomColors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
