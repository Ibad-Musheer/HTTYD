import 'package:flutter/material.dart';
import 'package:httyd/res/constants/constants.dart';
import 'package:httyd/res/theme/theme.dart';
import 'package:httyd/utils/responsiveSize.dart';
import 'package:httyd/utils/utils.dart';


class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonTitle;
  final double? height;
  final double? width;
  final BorderSide? border;
  final String? titleWhenProgress;
  final bool? isInProgress;
  final double? fontSize;
  final double? radius;
  final bool? autoWidth;
  final Widget? prefixWidget;
  final EdgeInsetsGeometry? padding;
  final bool? showProgressTitle;
  final double? progressWidth;
  final double? progressHeight;
  final bool? showElevation;
  final Color? textColor;
  final Color? buttonColor;

  final EdgeInsets? outerPadding;
  final Color? disabledColor;
  final VoidCallback? onTapDisabledButton;
  final bool? disabled;
  final TextStyle? btnTextStyle;
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.buttonTitle,
    this.height,
    this.width,
    this.border,
    this.titleWhenProgress,
    this.isInProgress,
    this.fontSize,
    this.radius,
    this.autoWidth,
    this.prefixWidget,
    this.padding,
    this.showProgressTitle,
    this.progressWidth,
    this.progressHeight,
    this.showElevation,
    this.textColor,
    this.buttonColor,
    this.outerPadding,
    this.disabledColor,
    this.onTapDisabledButton,
    this.disabled,
    this.btnTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    var title = '';

    if (isInProgress == true) {
      title = titleWhenProgress ?? buttonTitle;
    } else {
      title = buttonTitle;
    }
    return Padding(
      padding: outerPadding ?? EdgeInsets.zero,
      child: GestureDetector(
        onTap: () {
          if (disabled == true) {
            onTapDisabledButton?.call();
          }
        },
        child: MaterialButton(
          minWidth: autoWidth == true ? null : (width ?? double.infinity),
          height: height ?? 50.rh(context),
          padding: padding,
          shape: RoundedRectangleBorder(
            side: border ?? BorderSide.none,
            borderRadius: BorderRadius.circular(radius ?? 10),
          ),
          elevation: (showElevation ?? true) ? 0.5 : 0,
          color: buttonColor ?? CustomColors.primary,
          disabledColor: disabledColor ?? CustomColors.black,
          onPressed: (isInProgress == true || (disabled ?? false))
              ? null
              : () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  onPressed.call();
                },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isInProgress == true) ...{
                Utils.progress(
                  width: progressWidth ?? 16,
                  height: progressHeight ?? 16,
                  showWhite: true,
                ),
              },
              if (isInProgress != true) prefixWidget ?? const SizedBox.shrink(),
              if (isInProgress != true) ...[
                Text(
                  title,
                  style: btnTextStyle ??
                      Theme.of(context).textTheme.displayLarge!.copyWith(
                            color: textColor ?? CustomColors.primaryTextColor,
                            fontSize:
                                fontSize ?? context.font.larger.rf(context),
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1,
                            fontFamily: Constants.fontFamily,
                          ),
                ),
              ] else ...[
                if (showProgressTitle ?? false)
                  Text(
                    title,
                    style: btnTextStyle ??
                        Theme.of(context).textTheme.displayLarge!.copyWith(
                              color: textColor ?? CustomColors.primaryTextColor,
                              fontSize:
                                  fontSize ?? context.font.larger.rf(context),
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1,
                              fontFamily: Constants.fontFamily,
                            ),
                  ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
