import 'package:flutter/material.dart';
import '../color_manger/colors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: ColorManger.white,
      brightness: Brightness.light,
      primaryColor: ColorManger.black,
      primaryColorDark: ColorManger.white,
      hintColor: ColorManger.lightHintColor,
      buttonColor: ColorManger.black,
      iconTheme: IconThemeData(color: ColorManger.black),
      cardColor: ColorManger.lightSearchBackground);

  static final ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: ColorManger.dark,
      brightness: Brightness.dark,
      primaryColor: ColorManger.white,
      primaryColorDark: ColorManger.black,
      hintColor: ColorManger.darkHintColor,
      buttonColor: ColorManger.white,
      iconTheme: IconThemeData(color: ColorManger.white),
      cardColor: ColorManger.darkSearchBackground);
}
