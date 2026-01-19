import 'dart:async';
import 'package:flutter/material.dart';
import 'package:httyd/res/constants/media_constants.dart';
import 'package:httyd/utils/responsiveSize.dart';
import 'package:video_player/video_player.dart';
import 'package:camera/camera.dart';

class VideoPlaybackPage extends StatefulWidget {
  final VoidCallback? onVideoComplete;

  const VideoPlaybackPage({super.key, this.onVideoComplete});

  @override
  State<VideoPlaybackPage> createState() => VideoPlaybackPageState();
}

class VideoPlaybackPageState extends State<VideoPlaybackPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  VideoPlayerController? _videoController;
  CameraController? _cameraController;
  Timer? _videoPauseTimer;
  Timer? _cameraCloseTimer;
  double _bookCoverOpacity = 1.0;
  bool _hasStarted = false;
  bool _showCamera = false;

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

    // Start with animation at end (zoomed in state)
    _animationController.value = 1.0;
  }

  // Public method to start the sequence, called from parent
  void startSequence() {
    if (!_hasStarted) {
      Future.delayed(const Duration(milliseconds: 500), () {
        if (mounted) {
          _startSequence();
        }
      });
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    _videoPauseTimer?.cancel();
    _cameraCloseTimer?.cancel();
    _videoController?.dispose();
    _cameraController?.dispose();
    super.dispose();
  }

  void _startSequence() async {
    if (!_hasStarted && mounted) {
      _hasStarted = true;

      // Ensure a paused video frame is ready behind the book cover.
      await _ensureVideoBackgroundReady();
      if (!mounted) return;
      setState(() {});

      // First, reverse the scale animation (zoom back to original)
      await _animationController.reverse();

      // Then fade out book cover
      setState(() {
        _bookCoverOpacity = 0.0;
      });

      // Wait for fade out, then load and play remaining video
      Future.delayed(const Duration(milliseconds: 500), () {
        if (mounted) {
          _loadAndPlayVideo();
        }
      });
    }
  }

  void _loadAndPlayVideo() {
    if (_videoController != null && _videoController!.value.isInitialized) {
      setState(() {
        _videoController?.setLooping(false);
        _videoController?.play();
      });
      _videoPauseTimer = Timer(
        const Duration(seconds: 2, milliseconds: 200),
        () {
          if (mounted && _videoController != null) {
            _videoController?.pause();
            _initializeCamera();
          }
        },
      );
      return;
    }

    final videoPath = MediaConstants.introSmallVideo;
    _videoController = VideoPlayerController.asset(videoPath);

    _videoController
        ?.initialize()
        .then((_) {
          if (mounted && _videoController != null) {
            // Seek to 9 seconds (where we paused before)
            _videoController?.seekTo(const Duration(seconds: 9));

            setState(() {
              _videoController?.setLooping(false);
              _videoController?.play();
            });

            // Play for just 1 second
            _videoPauseTimer = Timer(const Duration(seconds: 2), () {
              if (mounted && _videoController != null) {
                _videoController?.pause();

                // Initialize and show camera after video pauses
                _initializeCamera();
              }
            });
          }
        })
        .catchError((error) {
          print('Error loading video: $error');
        });
  }

  Future<void> _initializeCamera() async {
    try {
      final cameras = await availableCameras();
      if (cameras.isEmpty) {
        print('No cameras available');
        return;
      }

      // Use the first available camera (usually front camera)
      _cameraController = CameraController(
        cameras.first,
        ResolutionPreset.high,
        enableAudio: false,
      );

      await _cameraController?.initialize();

      if (mounted) {
        setState(() {
          _showCamera = true;
        });

        // Close camera and resume video after 5 seconds
        _cameraCloseTimer = Timer(const Duration(seconds: 5), () {
          if (mounted) {
            _closeCameraAndResumeVideo();
          }
        });
      }
    } catch (e) {
      print('Error initializing camera: $e');
    }
  }

  void _closeCameraAndResumeVideo() async {
    // Hide camera
    setState(() {
      _showCamera = false;
    });

    // Dispose camera controller
    await _cameraController?.dispose();
    _cameraController = null;

    // Resume video playback
    if (_videoController != null && mounted) {
      _videoController?.play();

      // Calculate remaining video duration
      final totalDuration = _videoController?.value.duration;
      final currentPosition = _videoController?.value.position;

      if (totalDuration != null && currentPosition != null) {
        final remainingDuration = totalDuration - currentPosition;

        // Set timer for remaining duration
        _videoPauseTimer = Timer(remainingDuration, () {
          if (mounted && _videoController != null) {
            _videoController?.pause();

            // Show book cover and animate before navigating
            _animateBookCoverAndNavigate();
          }
        });
      }
    }
  }

  void _animateBookCoverAndNavigate() {
    if (!mounted) return;

    // Reset animation to start position
    _animationController.value = 0.0;

    // Fade in book cover
    setState(() {
      _bookCoverOpacity = 1.0;
    });

    // Wait for fade in, then animate zoom
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        _animationController.forward().then((_) {
          // After zoom animation completes, navigate
          Future.delayed(const Duration(milliseconds: 500), () {
            if (mounted && widget.onVideoComplete != null) {
              widget.onVideoComplete!();
            }
          });
        });
      }
    });
  }

  // Public method for retake: flip back, then run reverse book-cover animation.
  void startRetakeSequence() async {
    if (!mounted) return;

    _videoPauseTimer?.cancel();
    _cameraCloseTimer?.cancel();

    _videoController?.pause();
    _cameraController?.dispose();
    _cameraController = null;

    setState(() {
      _showCamera = false;
      _bookCoverOpacity = 1.0;
    });

    // Start from the fully zoomed-in state, then zoom out to reveal the video.
    _animationController.value = 1.0;
    await _ensureVideoBackgroundReady();
    if (!mounted) return;
    // Ensure the paused frame is painted before animation starts.
    setState(() {});
    try {
      await _animationController.reverse();
    } catch (_) {
      // No-op: still proceed to show camera even if animation fails.
    }
    if (!mounted) return;
    setState(() {
      _bookCoverOpacity = 0.0;
    });
    _initializeCamera();
  }

  // Public method to seek video to a specific timestamp
  void seekToTimestamp(Duration timestamp) {
    _videoController?.seekTo(timestamp);
  }

  Future<void> _ensureVideoBackgroundReady() async {
    try {
      if (_videoController != null && _videoController!.value.isInitialized) {
        return;
      }

      final videoPath = MediaConstants.introSmallVideo;
      _videoController = VideoPlayerController.asset(videoPath);
      await _videoController?.initialize();
      if (!mounted) return;

      // Show a paused frame at the same point as the retake sequence.
      await _videoController?.seekTo(
        const Duration(seconds: 8, milliseconds: 800),
      );
      setState(() {});
    } catch (e) {
      // If video fails to initialize, proceed without blocking retake flow.
      print('Error preparing video background: $e');
    }
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
          // Camera preview on top
          if (_showCamera &&
              _cameraController != null &&
              _cameraController!.value.isInitialized)
            Center(
              child: Transform.translate(
                offset: Offset(-30, -10),
                child: SizedBox(
                  width: 660,
                  height: 660,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18800),
                    child: CameraPreview(_cameraController!),
                  ),
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
        ],
      ),
    );
  }
}
