import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:httyd/res/constants/constants.dart';
import 'package:httyd/res/theme/theme.dart';
import 'package:httyd/utils/responsiveSize.dart';


class CustomDialog extends StatelessWidget {
  final String title;
  final String content;
  final String acceptButtonText;
  final VoidCallback acceptButtonOnTap;
  final bool? showTextField;
  final Widget? textField;
  const CustomDialog({
    super.key,
    required this.title,
    required this.content,
    required this.acceptButtonText,
    required this.acceptButtonOnTap,
    this.showTextField = false,
    this.textField,
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        systemNavigationBarDividerColor: Colors.transparent,
        statusBarColor: Colors.black.withValues(alpha: 0),
      ),
      child: AlertDialog(
        backgroundColor: CustomColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.displayLarge!.copyWith(
                color: CustomColors.primaryTextColor,
                fontWeight: FontWeight.w700,
                fontSize: context.font.larger + 2.rf(context),
                letterSpacing: 0.25,
              ),
          textAlign: TextAlign.center,
        ),
        content: showTextField == true
            ? textField
            : Text(
                content,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      color: CustomColors.secondaryTextColor,
                      fontWeight: FontWeight.w400,
                      fontSize: context.font.normal.rf(context),
                      letterSpacing: 1,
                      height: 1.3,
                    ),
              ),
        actionsOverflowAlignment: OverflowBarAlignment.center,
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Cancel Button
              button(
                context: context,
                buttonColor: CustomColors.textFieldFillColor,
                buttonName: Constants.cancel,
                textColor: CustomColors.primaryTextColor,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(width: 10.rw(context)),
              // Delete Button
              button(
                context: context,
                buttonColor: CustomColors.primaryTextColor,
                buttonName: acceptButtonText,
                textColor: CustomColors.white,
                onTap: acceptButtonOnTap,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget button({
    required BuildContext context,
    required Color buttonColor,
    required String buttonName,
    required Color textColor,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: context.screenWidth * 0.3,
      child: MaterialButton(
        elevation: 0,
        height: 49,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          // side: BorderSide(color: ThemeColors.textColor.withOpacity(0.1)),
        ),
        color: buttonColor,
        onPressed: onTap,
        child: Text(
          buttonName,
          style: Theme.of(context).textTheme.displayLarge!.copyWith(
                color: textColor,
                fontSize: context.font.normal.rf(context),
                fontWeight: FontWeight.w600,
                letterSpacing: 1,
              ),
        ),
      ),
    );
  }
}
