import 'dart:async';
import 'package:flutter/material.dart';
import 'package:httyd/res/constants/media_constants.dart';
import 'package:httyd/screens/confirm_license_image.dart';

class ConfirmLicenseWrapper extends StatefulWidget {
  final VoidCallback? onRetake;

  const ConfirmLicenseWrapper({super.key, this.onRetake});

  @override
  State<ConfirmLicenseWrapper> createState() => _ConfirmLicenseWrapperState();
}

class _ConfirmLicenseWrapperState extends State<ConfirmLicenseWrapper>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  double _bookCoverOpacity = 1.0;

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

    // Start with book cover fully zoomed in
    _animationController.value = 1.0;

    // Fade out book cover after a short delay
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        setState(() {
          _bookCoverOpacity = 0.0;
        });
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleRetake() {
    // Just flip back to the video playback screen.
    if (widget.onRetake != null) {
      widget.onRetake!();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final initialHeight = 1450.0;
    final targetHeight = screenSize.height;

    return Stack(
      children: [
        // Confirm License Image screen
        ConfirmLicenseImage(onRetake: _handleRetake),

        // Book cover overlay with animation
        Positioned.fill(
          child: IgnorePointer(
            child: Center(
              child: OverflowBox(
                maxWidth: double.infinity,
                maxHeight: double.infinity,
                child: AnimatedOpacity(
                  opacity: _bookCoverOpacity,
                  duration: const Duration(milliseconds: 500),
                  child: AnimatedBuilder(
                    animation: _scaleAnimation,
                    builder: (context, child) {
                      final animatedOffsetY =
                          60.0 * (1 - _scaleAnimation.value);
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
          ),
        ),
      ],
    );
  }
}
