
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:httyd/res/constants/constants.dart';
import 'package:httyd/res/theme/theme.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

enum MessageType {
  success(CustomColors.primaryTextColor),
  warning(CustomColors.warningMessageColor),
  error(CustomColors.errorMessageColor);

  final Color value;
  const MessageType(this.value);
}

class Utils {
  static final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  // Getter to access the global key
  static GlobalKey<ScaffoldMessengerState> get scaffoldMessengerKey =>
      _scaffoldMessengerKey;

  static Future<String> getImage(ImageSource source) async {
    String imagePath = "";

    try {
      final pickedFile = await ImagePicker().pickImage(source: source);

      if (pickedFile != null) {
        imagePath = pickedFile.path;
      }
      if (kDebugMode) {
        print('imagePath: $imagePath');
      }
      return imagePath;
    } catch (e) {
      if (kDebugMode) {
        print("Error picking image: $e");
      }
      return e.toString();
    }
  }

  static String capitalizeFirstLetterOfEveryWord(String text) {
    List<String> words = text.split(' ');
    List<String> capitalizedWords = words.map((word) {
      if (word.isNotEmpty) {
        return word[0].toUpperCase() + word.substring(1);
      } else {
        return '';
      }
    }).toList();
    return capitalizedWords.join(' ');
  }

 
  static showSnackBarMessage(
    String message, {
    int messageDuration = 3,
    MessageType? type,
    bool? isFloating,
    VoidCallback? onClose,
  }) async {
    final snackBar = _scaffoldMessengerKey.currentState!.showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: (isFloating ?? false) ? SnackBarBehavior.floating : null,
        backgroundColor: type?.value,
        duration: Duration(seconds: messageDuration),
      ),
    );

    final snackBarClosedReason = await snackBar.closed;
    if (SnackBarClosedReason.values.contains(snackBarClosedReason)) {
      onClose?.call();
    }
  }

  static Widget progress({
    double? width,
    double? height,
    Color? normalProgressColor,
    bool? showWhite,
  }) {
    if (Constants.useLottieProgress) {
      return LottieBuilder.asset(
        'assets/lottie/${showWhite == true ? Constants.progressLottieFileWhite : Constants.progressLottieFile}',
        width: width ?? 45,
        height: height ?? 45,
        delegates: LottieDelegates(
          values: [
            ValueDelegate.color(
              [
                'Layer 5 Outlines',
                'Group 1',
                '**',
              ],
              value: CustomColors.white,
            ),
            ValueDelegate.color(
              [
                'cube 4 Outlines',
                'Group 1',
                '**',
              ],
              value: CustomColors.white,
            ),
            ValueDelegate.color(
              [
                'cube 2 Outlines',
                'Group 1',
                '**',
              ],
              value: Colors.grey.shade100,
            ),
            ValueDelegate.color(
              [
                'cube 3 Outlines',
                'Group 1',
                '**',
              ],
              value: Colors.grey.shade100,
            ),
          ],
        ),
      );
    } else {
      return CircularProgressIndicator(
        color: normalProgressColor,
      );
    }
  }

  static Future<void> showCustomBottomSheet({
    required BuildContext context,
    required Widget child,
    bool? isScrolling,
  }) {
    return showModalBottomSheet(
      barrierColor: CustomColors.primaryTextColor.withValues(alpha:0.4),
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: isScrolling ?? false,
      useSafeArea: true,
      builder: (context) => child,
    );
  }
}
