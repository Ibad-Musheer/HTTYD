import 'package:flutter/material.dart';
import 'package:httyd/res/theme/theme.dart';

class CustomCheckbox extends StatelessWidget {
  final bool isChecked;
  final ValueChanged<bool> onChanged;
  final Color? boxColor;
  final Color? svgIconColor;

  const CustomCheckbox({
    super.key,
    required this.isChecked,
    required this.onChanged,
    this.boxColor,
    this.svgIconColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(!isChecked);
      },
      child: Container(
        height: 20,
        width: 20,
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: boxColor ??
              (isChecked ? CustomColors.primary : CustomColors.bodyTextColor),
          borderRadius: BorderRadius.circular(5),
        ),
        child: isChecked
            ? Icon(
                Icons.check,
                color: svgIconColor ?? CustomColors.primaryTextColor,
              )

            // SvgPicture.asset(
            //     MediaConstants.checkBoxIcon,
            //     width: 12.0,
            //     height: 12.0,
            //     colorFilter: ColorFilter.mode(
            //       svgIconColor ?? CustomColors.primaryTextColor,
            //       BlendMode.srcIn,
            //     ),
            //   )
            : null,
      ),
    );
  }
}
