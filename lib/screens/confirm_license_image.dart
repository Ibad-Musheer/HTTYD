import 'package:flutter/material.dart';
import 'package:httyd/res/constants/constants.dart';
import 'package:httyd/res/constants/media_constants.dart';
import 'package:httyd/res/routes/routes.dart';
import 'package:httyd/res/theme/theme.dart';
import 'package:httyd/utils/responsiveSize.dart';

class ConfirmLicenseImage extends StatefulWidget {
  final VoidCallback? onRetake;

  const ConfirmLicenseImage({super.key, this.onRetake});

  @override
  State<ConfirmLicenseImage> createState() => _ConfirmLicenseImageState();
}

class _ConfirmLicenseImageState extends State<ConfirmLicenseImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: context.screenWidth,
        height: context.screenHeight,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(MediaConstants.confirmLicenseImage),
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 355,
              left: 350,
              right: 350,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RouteNames.digitalCopy);
                },
                child: SizedBox(
                  height: 105,
                  width: 550,

                  child: Center(
                    child: Text(
                      "CONFIRM AND PRINT",
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
              top: 775,
              left: 250,
              right: 240,
              child: Container(height: 635), //IDHAR IMAGE AYEGI
            ),
            Positioned(
              bottom: 215,
              left: 455,
              right: 455,
              child: GestureDetector(
                onTap: () {
                  widget.onRetake!();
                },
                child: SizedBox(
                  height: 105,
                  // color: Colors.red,
                  child: Center(
                    child: Text(
                      "RETAKE",
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
    );
  }
}
