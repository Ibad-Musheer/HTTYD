import 'dart:async';
import 'package:flutter/material.dart';
import 'package:httyd/res/constants/constants.dart';
import 'package:httyd/res/constants/media_constants.dart';
import 'package:httyd/res/routes/routes.dart';
import 'package:httyd/utils/responsiveSize.dart';
import 'package:video_player/video_player.dart';

class StartingPage extends StatefulWidget {
  const StartingPage({super.key});

  @override
  State<StartingPage> createState() => _StartingPageState();
}

class _StartingPageState extends State<StartingPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  VideoPlayerController? _videoController;
  Timer? _videoPauseTimer;
  double _bookCoverOpacity = 0.0;

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
    _videoPauseTimer?.cancel();
    _videoController?.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _increaseImageCacheSize();
    _preloadImages();
    _preloadVideo();
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
    precacheImage(AssetImage(MediaConstants.confirmLicenseImage), context);
    precacheImage(AssetImage(MediaConstants.selectVikingNameBg), context);
    precacheImage(AssetImage(MediaConstants.digitalCopyBg), context);
    precacheImage(AssetImage(MediaConstants.thankYouBg), context);
  }

  void _preloadVideo() {
    // Preload video by initializing the controller
    final videoPath = MediaConstants.introSmallVideo;
    print('Loading video from: $videoPath');

    _videoController = VideoPlayerController.asset(videoPath);
    _videoController
        ?.initialize()
        .then((_) {
          // Video is now loaded and ready - play it
          if (mounted && _videoController != null) {
            setState(() {
              // Double the playback speed
              _videoController?.play();
              _videoController?.setLooping(false);

              // Pause after 14 seconds
              _videoPauseTimer = Timer(
                const Duration(seconds: 8, milliseconds: 900),
                () {
                  if (mounted && _videoController != null) {
                    setState(() {
                      _videoController?.pause();
                      _bookCoverOpacity = 1.0;
                    });
                  }
                },
              );
            });
          }
        })
        .catchError((error) {
          // Handle error if video fails to load
          print('Error preloading video: $error');
          print('Video path attempted: $videoPath');
        });
  }

  void _handleStartPressed() {
    print("Start button pressed");
    _animationController.forward().then((_) {
      Navigator.pushNamed(context, RouteNames.selectYourDragon);
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final initialHeight = 1250.0;
    final targetHeight = screenSize.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: context.screenHeight,
        width: context.screenWidth,
        child: Stack(
          children: [
            // Video player
            if (_videoController != null &&
                _videoController!.value.isInitialized)
              Positioned.fill(
                child: IgnorePointer(child: VideoPlayer(_videoController!)),
              ),

            Transform.translate(
              offset: Offset(0, 60),
              child: Center(
                child: Opacity(
                  opacity: _bookCoverOpacity,
                  child: AnimatedBuilder(
                    animation: _scaleAnimation,
                    builder: (context, child) {
                      // Interpolate from initial size to full screen size
                      final animatedHeight =
                          initialHeight +
                          (_scaleAnimation.value *
                              (targetHeight - initialHeight));
                      final animatedWidth =
                          980.0 +
                          (_scaleAnimation.value * (screenSize.width - 1150.0));

                      const initialTop = 905.0;
                      // Calculate target top position to maintain relative position in full screen
                      final targetTop =
                          (initialTop / initialHeight) * targetHeight;
                      final animatedTop =
                          initialTop +
                          (_scaleAnimation.value * (targetTop - initialTop));

                      return IgnorePointer(
                        child: Container(
                          height: animatedHeight,
                          width: animatedWidth,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(MediaConstants.bookCover),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            Positioned(
              top: 1125,
              left: 490,

              child: GestureDetector(
                onTap: _handleStartPressed,
                child: Container(
                  width: 285,
                  height: 75,
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
  }
}
