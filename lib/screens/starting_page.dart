import 'package:flutter/material.dart';
import 'package:httyd/res/constants/constants.dart';
import 'package:httyd/res/constants/media_constants.dart';
import 'package:httyd/res/routes/routes.dart';
import 'package:httyd/res/theme/theme.dart';

class StartingPage extends StatefulWidget {
  const StartingPage({super.key});

  @override
  State<StartingPage> createState() => _StartingPageState();
}

class _StartingPageState extends State<StartingPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _increaseImageCacheSize();
    _preloadImages();
  }

  void _increaseImageCacheSize() {
    // Increase image cache size to allow more images to be preloaded
    final imageCache = PaintingBinding.instance.imageCache;
    imageCache.maximumSize = 2000; // Increase from default 1000 to 2000
    imageCache.maximumSizeBytes =
        500 * 1024 * 1024; // 500 MB (default is 100 MB)
  }

  void _preloadImages() {
    // Preload all images used in select_your_dragon screen
    precacheImage(AssetImage(MediaConstants.paperBackground), context);
    precacheImage(AssetImage(MediaConstants.lineDecoration), context);
    precacheImage(AssetImage(MediaConstants.circle), context);
    precacheImage(AssetImage(MediaConstants.selectYourDragon), context);
    precacheImage(AssetImage(MediaConstants.isleOfBerk), context);
    precacheImage(AssetImage(MediaConstants.dragonContainer), context);
    precacheImage(AssetImage(MediaConstants.dragon1), context);
    precacheImage(AssetImage(MediaConstants.dragon2), context);
    precacheImage(AssetImage(MediaConstants.dragon3), context);
    precacheImage(AssetImage(MediaConstants.dragon4), context);
    precacheImage(AssetImage(MediaConstants.bottomLeftDarkBgEffect), context);
    precacheImage(AssetImage(MediaConstants.leftDarkBgEffect), context);
    precacheImage(AssetImage(MediaConstants.isleOfBerkVertical), context);
    precacheImage(AssetImage(MediaConstants.topRightDarkBgEffect), context);
    // Preload images used in select_viking_name screen
    precacheImage(AssetImage(MediaConstants.selectVikingNameBg), context);
  }

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
                  MediaConstants.bookCover,
                  height: 1560,
                  fit: BoxFit.fitHeight,
                ),
                Positioned(
                  top: 300,
                  left: 270,
                  right: 0,
                  child: Text(
                    "DragonRiding",
                    style: TextStyle(
                      fontSize: 130,
                      fontFamily: Constants.fontPiecesOfEight,
                      color: CustomColors.primaryTextColor.withOpacity(0.85),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 120,
                  left: 100,
                  child: Image.asset(
                    MediaConstants.bottomLeftBgEffect,
                    width: 150,
                    height: 70,
                  ),
                ),
                Positioned(
                  top: 455,
                  left: 170,
                  child: Image.asset(
                    MediaConstants.leftBgEffect,
                    width: 50,
                    height: 650,
                  ),
                ),
                Positioned(
                  top: 50,
                  right: 150,
                  child: Image.asset(
                    MediaConstants.topRightBgEffect,
                    width: 150,
                    height: 180,
                  ),
                ),
                Positioned(
                  top: 420,
                  left: 400,
                  right: 0,
                  child: Text(
                    "License",
                    style: TextStyle(
                      fontSize: 130,
                      letterSpacing: 0,
                      height: 0,
                      fontFamily: Constants.fontPiecesOfEight,
                      color: CustomColors.primaryTextColor,
                    ),
                  ),
                ),

                Positioned(
                  top: 882,
                  left: 428,
                  right: 428,
                  child: MaterialButton(
                    padding: EdgeInsets.symmetric(vertical: 25),
                    color: CustomColors.buttonColor.withOpacity(0.95),
                    onPressed: () {
                      Navigator.pushNamed(context, RouteNames.selectYourDragon);
                    },
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
