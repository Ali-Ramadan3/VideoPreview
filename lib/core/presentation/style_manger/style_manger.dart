import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../fonts_manger/fonts_manger.dart';

TextStyle _getTextStyle(
    double fontSize, String fontFamily, FontWeight fontWeight, Color color) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: fontFamily,
      color: color,
      fontWeight: fontWeight);
}

TextStyle getPoppinsStyle({
  required double fontSize,
  required Color color,
  required FontWeight fontWeight,
}) {
  return _getTextStyle(
      fontSize, FontConstants.fontFamilyPoppins, fontWeight, color);
}

ButtonStyle primaryButtonStyle({
  required double border,
  required double fontSize,
  required Color textColor,
  required Color backGroundColor,
  required double buttonWidth,
}) {
  return ButtonStyle(
    textStyle: MaterialStateProperty.all<TextStyle>(getPoppinsStyle(
        fontSize: fontSize,
        color: textColor,
        fontWeight: FontWeightManager.simBold)),
    padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(0.w)),
    minimumSize: MaterialStateProperty.all<Size>(Size(buttonWidth.w, 50.w)),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(border.w),
            side: BorderSide(color: backGroundColor))),
    foregroundColor: MaterialStateProperty.all<Color>(textColor),
    backgroundColor: MaterialStateProperty.all<Color>(backGroundColor),
    overlayColor: MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.hovered)) {
          return Colors.blue.withOpacity(0.04);
        }
        if (states.contains(MaterialState.focused) ||
            states.contains(MaterialState.pressed)) {
          return Colors.blue.withOpacity(0.12);
        }
        return null;
      },
    ),
  );
}
