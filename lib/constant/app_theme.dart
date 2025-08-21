import 'package:flutter/material.dart';
import 'color.dart';

final ThemeData themeData = ThemeData(
    fontFamily: 'Lato',
    brightness: Brightness.light,
    primaryColor: AppColors.green[500],
    colorScheme: ColorScheme.fromSwatch(
            primarySwatch:
                MaterialColor(AppColors.green[500]!.value, AppColors.green))
        .copyWith(secondary: AppColors.green[500]));

class AppColors {
  AppColors._(); // this basically makes it so you can instantiate this class

  static const Map<int, Color> green = <int, Color>{
    50: Color(0xFFf2f8ef),
    100: Color(0xFFdfedd8),
    200: Color(0xFFc9e2be),
    300: Color(0xFFb3d6a4),
    400: Color(0xFFa3cd91),
    500: Color(0xFF93c47d),
    600: Color(0xFF8bbe75),
    700: Color(0xFF80b66a),
    800: Color(0xFF76af60),
    900: Color(0xFF64a24d)
  };
}

TextStyle primaryTextStyle =
    const TextStyle(fontFamily: 'Lato', color: primaryColor);
TextStyle blackTextStyle =
    const TextStyle(fontFamily: 'Lato', color: blackColor);
TextStyle secondTextStyle = TextStyle(fontFamily: 'Lato', color: secondColor);
TextStyle greyTextStyle =
    const TextStyle(fontFamily: 'Lato', color: greyColor);
TextStyle whiteTextStyle =
    const TextStyle(fontFamily: 'Lato', color: whiteColor);
