// ignore_for_file: file_names

import 'package:flutter/material.dart';

//Warning Don't Edit or change this file otherwise your whole UI will get error
extension CustomContext on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;

  //This one for colorScheme shortcut
  ColorScheme get color => Theme.of(this).colorScheme;

//This one for fontSize
  ///I created different Font class to limit textTheme values, let's assume if some one is using context.font and he is getting too may options related to text theme so how will he know which one is for use??
  ///So in theme.dart file i have created Font class which will give limited numbers of getters
  Font get font => Theme.of(this).textTheme.font;
}

extension Sizing on num {
  ///Responsive height
  double rh(context) {
    //!Don't change [812]
    const aspectedScreenHeight = 812;

    final size = MediaQuery.of(context).size;
    final responsiveHeight = size.height * (this / aspectedScreenHeight);
    return responsiveHeight;
  }

  ///Responsive width
  double rw(context) {
    //!Don't change  [375]
    const aspectedScreenWidth = 375;

    final size = MediaQuery.of(context).size;
    final responsiveWidth = size.width * (this / aspectedScreenWidth);
    return responsiveWidth;
  }

  ///Responsive font
  double rf(context) {
    const aspectedScreenHeight = 812;
    return (this / aspectedScreenHeight) * MediaQuery.of(context).size.height;
  }
}

class Font {
  ///10
  double get smaller => 10;

  ///12
  double get small => 12;

  ///14
  double get normal => 14;

  ///16
  double get large => 16;

  ///18
  double get larger => 18;

  ///24
  double get extraLarge => 24;

  ///28
  double get xxLarge => 28;
}

extension TextThemeForFont on TextTheme {
  Font get font => Font();
}
