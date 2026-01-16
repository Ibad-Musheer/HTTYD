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

class _StartingPageState extends State<StartingPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _scaleAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

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
    precacheImage(AssetImage(MediaConstants.selectVikingNameBg), context);
    precacheImage(AssetImage(MediaConstants.digitalCopyBg), context);
    precacheImage(AssetImage(MediaConstants.thankYouBg), context);
  }

  void _handleStartPressed() {
    _animationController.forward().then((_) {
      Navigator.pushNamed(context, RouteNames.selectYourDragon);
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final initialHeight = 1560.0;
    final targetHeight = screenSize.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          // Interpolate from initial size to full screen size
          final animatedHeight =
              initialHeight +
              (_scaleAnimation.value * (targetHeight - initialHeight));
          final animatedWidth = 1150.0;

          const initialTop = 885.0;
          // Calculate target top position to maintain relative position in full screen
          final targetTop = (initialTop / initialHeight) * targetHeight;
          final animatedTop =
              initialTop + (_scaleAnimation.value * (targetTop - initialTop));

          return Center(
            child: Container(
              height: animatedHeight,
              width: animatedWidth,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(MediaConstants.bookCover),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  // Positioned(
                  //   top: 300,
                  //   left: 320,
                  //   right: 0,
                  //   child: Text(
                  //     "DragonRiding",
                  //     style: TextStyle(
                  //       fontSize: 130,
                  //       fontFamily: Constants.fontPiecesOfEight,
                  //       color: CustomColors.primaryTextColor.withOpacity(0.85),
                  //     ),
                  //   ),
                  // ),
                  // Positioned(
                  //   top: 420,
                  //   left: 450,
                  //   right: 0,
                  //   child: Text(
                  //     "License",
                  //     style: TextStyle(
                  //       fontSize: 130,
                  //       letterSpacing: 0,
                  //       height: 0,
                  //       fontFamily: Constants.fontPiecesOfEight,
                  //       color: CustomColors.primaryTextColor,
                  //     ),
                  //   ),
                  // ),
                  // Positioned(
                  //   bottom: 120,
                  //   left: 100,
                  //   child: Image.asset(
                  //     MediaConstants.bottomLeftBgEffect,
                  //     width: 150,
                  //     height: 70,
                  //   ),
                  // ),
                  // Positioned(
                  //   top: 455,
                  //   left: 170,
                  //   child: Image.asset(
                  //     MediaConstants.leftBgEffect,
                  //     width: 50,
                  //     height: 650,
                  //   ),
                  // ),
                  // Positioned(
                  //   top: 50,
                  //   right: 150,
                  //   child: Image.asset(
                  //     MediaConstants.topRightBgEffect,
                  //     width: 150,
                  //     height: 180,
                  //   ),
                  // ),
                  Positioned(
                    top: animatedTop,
                    left: 430,
                    right: 390,
                    child: GestureDetector(
                      onTap: _handleStartPressed,
                      child: Container(
                        width: 550,
                        height: 100,
                        color: Colors.transparent,
                        child: Center(
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
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
