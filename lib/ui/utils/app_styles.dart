import 'package:flutter/cupertino.dart';

import 'app_color.dart';

class AppStyles {
  static const double SmallTextSize = 13;
  static const double MediumTextSize = 16;
  static const double LargeTextSize = 24;

  static const double BorderRadiusNormal = 10;

  static const double TextLineSpacing = 1.30;

//text style
  static final TextStyleWhiteNormalSize = TextStyle(
      color: AppColors.white,
      height: TextLineSpacing,
      fontSize: SmallTextSize,
      decoration: TextDecoration.none);
  static final TextStyleRedNormalSize = TextStyle(
      color: AppColors.appRed1Color,
      height: TextLineSpacing,
      fontSize: SmallTextSize,
      decoration: TextDecoration.none);

  static final TextStyleTitleWhiteLargeSize = TextStyle(
      color: AppColors.white,
      height: TextLineSpacing,
      fontSize: LargeTextSize,
      decoration: TextDecoration.none);

  //text input style

  static TextStyle styleTextInputNormarl = TextStyle(
    color: AppColors.hex("101213"),
    fontWeight: FontWeight.normal,
    fontSize: SmallTextSize,
  );

  static const TextStyle styleTextNormalHintColor = TextStyle(
      color: Color(0xFF808080),
      fontWeight: FontWeight.normal,
      fontSize: SmallTextSize);
}
