import 'dart:async';
import 'package:flutter/material.dart';
import 'package:httyd/res/constants/constants.dart';
import 'package:httyd/res/constants/media_constants.dart';
import 'package:httyd/screens/confirm_license_wrapper.dart';
import 'package:httyd/screens/digital_copy.dart';
import 'package:httyd/screens/select_viking_name.dart';
import 'package:httyd/screens/select_your_dragon.dart';
import 'package:httyd/screens/thank_you_screen.dart';
import 'package:httyd/screens/video_playback_page.dart';
import 'package:httyd/utils/responsiveSize.dart';
import 'package:video_player/video_player.dart';
import 'package:page_flip/page_flip.dart';

class StartingPage extends StatefulWidget {
  const StartingPage({super.key});

  @override
  State<StartingPage> createState() => _StartingPageState();
}

class _StartingPageState extends State<StartingPage> {
  final GlobalKey<PageFlipWidgetState> _pageFlipKey = GlobalKey();
  final GlobalKey<VideoPlaybackPageState> _videoPlaybackKey = GlobalKey();
  Key _vikingNameKey = UniqueKey();

  void _flipPage() {
    _pageFlipKey.currentState?.nextPage();
  }

  void _flipToVideoPlayback() {
    _videoPlaybackKey.currentState?.seekToTimestamp(
      const Duration(seconds: 9, milliseconds: 170),
    );

    _pageFlipKey.currentState?.nextPage();

    // Start the video playback sequence after page flip
    Future.delayed(const Duration(milliseconds: 700), () {
      _videoPlaybackKey.currentState?.startSequence();
    });
  }

  void _flipBackToVideoPlayback() {
    _videoPlaybackKey.currentState?.seekToTimestamp(
      const Duration(seconds: 9, milliseconds: 170),
    );

    _pageFlipKey.currentState?.previousPage();

    // Start the video playback sequence after page flip
    Future.delayed(const Duration(milliseconds: 700), () {
      _videoPlaybackKey.currentState?.startSequence();
    });
  }

  void _flipToVikingName() {
    // Reset the third page before navigating to it.

    setState(() {
      _vikingNameKey = UniqueKey();
    });

    // Seek VideoPlaybackPage to 8.9 seconds

    _videoPlaybackKey.currentState?.seekToTimestamp(
      const Duration(seconds: 8, milliseconds: 650),
    );

    _pageFlipKey.currentState?.nextPage();
  }

  void _handleRetake() {
    _videoPlaybackKey.currentState?.seekToTimestamp(
      const Duration(seconds: 8, milliseconds: 700),
    );
    // Go back to VideoPlaybackPage (index 3)
    _pageFlipKey.currentState?.previousPage();
  }

  void _resetApp() {
    // Reset to first page
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => StartingPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageFlipWidget(
        duration: const Duration(milliseconds: 650),
        key: _pageFlipKey,
        backgroundColor: Colors.black,
        initialIndex: 0,
        children: [
          _FirstPage(onFlipPage: _flipPage),
          SelectYourDragon(onDragonSelected: _flipToVikingName),
          SelectVikingName(
            key: _vikingNameKey,
            onNameConfirmed: _flipToVideoPlayback,
          ),
          VideoPlaybackPage(key: _videoPlaybackKey, onVideoComplete: _flipPage),
          ConfirmLicenseWrapper(
            onRetake: _flipBackToVideoPlayback,
            onConfirm: _flipPage,
          ), //_handleRetake
          DigitalCopy(onConfirm: _flipPage),
          ThankYouScreen(onReset: _resetApp),
        ],
      ),
    );
  }
}

class _FirstPage extends StatefulWidget {
  final VoidCallback onFlipPage;

  const _FirstPage({required this.onFlipPage});

  @override
  State<_FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<_FirstPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  VideoPlayerController? _videoController;
  Timer? _videoPauseTimer;
  double _bookCoverOpacity = 1.0;
  bool _startPressed = false;

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
    final imageCache = PaintingBinding.instance.imageCache;
    imageCache.maximumSize = 2000;
    imageCache.maximumSizeBytes = 500 * 1024 * 1024;
  }

  void _preloadImages() {
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
    final videoPath = MediaConstants.introSmallVideo;

    _videoController = VideoPlayerController.asset(videoPath);
    _videoController
        ?.initialize()
        .then((_) {
          if (mounted && _videoController != null) {
            setState(() {
              _videoController?.setLooping(false);
            });
          }
        })
        .catchError((error) {
          print('Error loading video: $error');
        });
  }

  void _playVideoAndWaitForEnd() {
    if (_videoController != null && mounted) {
      setState(() {
        _bookCoverOpacity = 0.0; // Fade out book cover when START is pressed
      });
      _videoController?.play();
      _videoPauseTimer = Timer(
        const Duration(seconds: 8, milliseconds: 900),
        () {
          if (mounted && _videoController != null) {
            setState(() {
              _videoController?.pause();
              _bookCoverOpacity = 1.0; // Fade in book cover when video ends
            });
            Future.delayed(const Duration(milliseconds: 500), () {
              if (mounted) {
                _animationController.forward().then((_) {
                  Future.delayed(const Duration(milliseconds: 500), () {
                    if (mounted) {
                      widget.onFlipPage();
                    }
                  });
                });
              }
            });
          }
        },
      );
    }
  }

  void _handleStartPressed() {
    setState(() {
      _startPressed = true;
    });
    _playVideoAndWaitForEnd();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final initialHeight = 1450.0;
    final targetHeight = screenSize.height;

    return Container(
      height: context.screenHeight,
      width: context.screenWidth,
      color: Colors.black,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Video player
          if (_videoController != null && _videoController!.value.isInitialized)
            SizedBox(
              width: context.screenWidth,
              height: context.screenHeight,
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: _videoController!.value.size.width,
                  height: _videoController!.value.size.height,
                  child: VideoPlayer(_videoController!),
                ),
              ),
            ),
          // Book cover
          Center(
            child: OverflowBox(
              maxWidth: double.infinity,
              maxHeight: double.infinity,
              child: AnimatedOpacity(
                opacity: _bookCoverOpacity,
                duration: const Duration(milliseconds: 500),
                child: AnimatedBuilder(
                  animation: _scaleAnimation,
                  builder: (context, child) {
                    final animatedOffsetY = 60.0 * (1 - _scaleAnimation.value);
                    final animatedHeight =
                        initialHeight +
                        (_scaleAnimation.value *
                            (targetHeight - initialHeight));
                    final animatedWidth =
                        980.0 +
                        (_scaleAnimation.value *
                            (screenSize.width + 200 - 980.0));

                    return Transform.translate(
                      offset: Offset(0, animatedOffsetY),
                      child: IgnorePointer(
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
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          // START button
          Positioned(
            top: 1145,
            left: 490,
            child: GestureDetector(
              onTap: _handleStartPressed,
              child: AnimatedOpacity(
                opacity: _startPressed ? 0.0 : 1.0,
                duration: const Duration(milliseconds: 300),
                child: IgnorePointer(
                  ignoring: _startPressed,
                  child: Container(
                    width: 285,
                    height: 75,
                    color: Color(0xff6D553E),
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
            ),
          ),
        ],
      ),
    );
  }
}
