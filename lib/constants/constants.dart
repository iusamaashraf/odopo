import 'dart:math';

import 'package:flutter/material.dart';
import 'package:odopa/constants/colors.dart';

Color maincolor = const Color(0xff99AEE2);
Color maincolordark = const Color(0xff4F5666);
Color mainBtnColor = const Color(0xff99AEE2);
Color mainTextColor = const Color(0xff7D94CC);
Color lightTextGrey = const Color(0xffABB3BB);
Color mainLightColor = const Color(0xffBECBEB);
Color hintTextColor = const Color(0xffABB3BB);

Color mainLightBackground = const Color(0xffF7F8FD);

Color mainDarkBackground = const Color(0xff1B1B1F);
Color btnDarkBgColor = const Color(0xff333339);
//FONT FAMILY START //

String appMainFont = "greycliffcf";
String workSansRegular = "WorkSans";
String workSansSemibold = "WorkSans-SemiBold";
String nunitoSansRegular = "nunito-sans.regular";
String greyCliffMedium = "greycliffcf-medium";
String sfProFont = "SF-Pro-Text-Regular";

//FONT FAMILY  END //

// Color(0xff7E93CB); //
final lighttheme = ThemeData(
  fontFamily: "greycliffcf",
  scaffoldBackgroundColor: Color(0xffF7F8FD),
  brightness: Brightness.light,
  textButtonTheme: TextButtonThemeData(
      style:
          ButtonStyle(foregroundColor: MaterialStateProperty.all(maincolor))),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white, backgroundColor: ColorClass.primaryColor,
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          width: 2.0,
          color: maincolor,

          //borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      // Text color
    ),
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(color: maincolor),
    bodyText2: TextStyle(color: maincolor),
  ),
  appBarTheme: AppBarTheme(
      color: Colors.transparent,
      iconTheme: IconThemeData(color: maincolor),
      titleTextStyle: TextStyle(
        color: maincolor,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      shadowColor: Colors.transparent),
  primarySwatch: generateMaterialColor(Palette.primary),
);
final darktheme = ThemeData(
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white, backgroundColor: const Color(0xff333339),
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(
          width: 2.0,
          color: Colors.white,

          //borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      // Text color
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all(
        Colors.white,
      ),
    ),
  ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(color: Colors.white),
    bodyText2: TextStyle(color: Colors.white),
  ),
  brightness: Brightness.dark,
  fontFamily: "greycliffcf",
  scaffoldBackgroundColor: const Color(0xff23262F),
  appBarTheme: const AppBarTheme(
      color: Colors.transparent,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      shadowColor: Colors.transparent),
  primarySwatch: generateMaterialColor(Palette.primary),
);

class Palette {
  static Color primary = const Color(0xff99AEE2);
}

MaterialColor generateMaterialColor(Color color) {
  return MaterialColor(color.value, {
    50: tintColor(color, 0.9),
    100: tintColor(color, 0.8),
    200: tintColor(color, 0.6),
    300: tintColor(color, 0.4),
    400: tintColor(color, 0.2),
    500: color,
    600: shadeColor(color, 0.1),
    700: shadeColor(color, 0.2),
    800: shadeColor(color, 0.3),
    900: shadeColor(color, 0.4),
  });
}

int tintValue(int value, double factor) =>
    max(0, min((value + ((255 - value) * factor)).round(), 255));

Color tintColor(Color color, double factor) => Color.fromRGBO(
    tintValue(color.red, factor),
    tintValue(color.green, factor),
    tintValue(color.blue, factor),
    1);

int shadeValue(int value, double factor) =>
    max(0, min(value - (value * factor).round(), 255));

Color shadeColor(Color color, double factor) => Color.fromRGBO(
    shadeValue(color.red, factor),
    shadeValue(color.green, factor),
    shadeValue(color.blue, factor),
    1);
