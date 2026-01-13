import 'package:flutter/material.dart';
import 'package:httyd/res/theme/theme.dart';

class CustomSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color? bgCloseColor;
  const CustomSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.bgCloseColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(!value);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 45,
        height: 25,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: value
              ? CustomColors.primary
              : bgCloseColor ?? CustomColors.bodyTextColor,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 3),
        child: Stack(
          children: [
            Align(
              alignment: value ? Alignment.centerRight : Alignment.centerLeft,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 20,
                height: 20,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
