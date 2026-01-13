import 'package:flutter/material.dart';
import 'package:httyd/res/theme/theme.dart';

class CustomSafeArea extends StatelessWidget {
  final Widget child;
  final Color? bgColor;
  final bool? showBorder;
  const CustomSafeArea({
    super.key,
    required this.child,
    this.bgColor,
    this.showBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor ?? CustomColors.navBarColor,
        borderRadius: showBorder == true
            ? const BorderRadius.vertical(top: Radius.circular(24))
            : null,
      ),
      child: SafeArea(child: child),
    );
  }
}
