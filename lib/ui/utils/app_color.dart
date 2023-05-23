import 'package:flutter/material.dart';

class AppColors {
  static const Color colorPrimary = Color(0xFF206AD2);
  static Color primaryBackground = Color(0xFFF4F6FA);
  static const Color primaryText = Color(0xFF2D3142);
  static const Color primaryGreyText = Color(0xFF9B9B9B);
  static const Color primaryGreyText1 = Color(0xFFE0DDF5);

  static Color lightScaffoldBackgroundColor = hexToColor('#F9F9F9');
  static Color darkScaffoldBackgroundColor = hexToColor('#2F2E2E');
  static Color secondaryAppColor = hexToColor('#22DDA6');
  static Color secondaryDarkAppColor = Colors.white;
  static Color tipColor = hexToColor('#B6B6B6');
  static Color lightGray = Color(0xFFF6F6F6);
  static Color darkGray = Color(0xFF9F9F9F);
  static Color black = Color(0xFF000000);
  static Color white = Color(0xFFFFFFFF);

  // static const Color appColor = Color(0xFF118EED);
  static const Color appColor = Color(0xFF206AD2); //
  static const Color appTabColor = Color(0xFF118EED);
  static const Color divider_color = Color(0xFFE4ECF2);

  static Color appGrayBorderColor = hexToColor("#DBDBDB");
  static Color appGrayColor = hexToColor("#F5F7F8");
  static Color appBackgroundColor = hexToColor("#FFFFFF");
  static Color appGray1Color = hexToColor("#676767");
  static Color appGray2Color = hexToColor("#979797");
  static Color appGray3Color = hexToColor("#D0D7DD");
  static Color appGray4Color = hexToColor("#E3E3E3");
  static Color appGray5Color = hexToColor("#F5F7F8");
  static Color appRed1Color = hexToColor("#FB6D77");
  static Color appRed2Color = hexToColor("#F21E3C");

  static Color appGreenColor = hexToColor("#00AA65");

  static Color appTextGrayColor = hexToColor("#D0D7DD");
  static Color appTextBlackColor = hexToColor("#101213");
  static Color appTabbarTitleColor = hexToColor("#787878");

  static const Color bg_color = Color(0xFFE5E5E5);
  static MaterialColor hex(String hex) =>
      AppColors._factoryColor(AppColors._getColorHexFromStr(hex));

  static MaterialColor _factoryColor(int color) {
    return MaterialColor(color, <int, Color>{
      50: Color(color),
      100: Color(color),
      200: Color(color),
      300: Color(color),
      400: Color(color),
      500: Color(color),
      600: Color(color),
      700: Color(color),
      800: Color(color),
      900: Color(color),
    });
  }

  static int _getColorHexFromStr(String colorStr) {
    colorStr = "FF" + colorStr;
    colorStr = colorStr.replaceAll("#", "");
    int val = 0;
    int len = colorStr.length;
    for (int i = 0; i < len; i++) {
      int hexDigit = colorStr.codeUnitAt(i);
      if (hexDigit >= 48 && hexDigit <= 57) {
        val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 65 && hexDigit <= 70) {
        // A..F
        val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 97 && hexDigit <= 102) {
        // a..f
        val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
      } else {
        val = 0xFFFFFFFF;
      }
    }
    return val;
  }

  static Color getColorFromHex(String hexColor) {
    hexColor = hexColor.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
    return Colors.white;
  }
}

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
      'hex color must be #rrggbb or #rrggbbaa');

  return Color(
    int.parse(hex.substring(1), radix: 16) +
        (hex.length == 7 ? 0xff000000 : 0x00000000),
  );
}
