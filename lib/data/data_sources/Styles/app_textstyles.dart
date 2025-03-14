import 'package:driver_app/data/data_sources/Colors/dark_colors_palate.dart';
import 'package:driver_app/export.dart';

class AppTextStyles {
//   Bold
  AppTextStyles._();

  static final AppTextStyles instance = AppTextStyles._();

  static TextStyle bold({
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
  }) {
    return TextStyle(
        fontSize: fontSize ?? 18,
        letterSpacing: letterSpacing ?? 0,
        color: color ?? DarkColorsPalate.tertiaryColor,
        fontFamily: 'SF Pro',
        fontWeight: fontWeight ?? FontWeight.w700);
  }

  // Medium
  static TextStyle medium({
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
  }) {
    return TextStyle(
        fontSize: fontSize ?? 17,
        letterSpacing: letterSpacing ?? 0,
        color: color ?? DarkColorsPalate.tertiaryColor,
        fontFamily: 'SF Pro',
        fontWeight: fontWeight ?? FontWeight.w500);
  }

  // Regular
  static TextStyle regular({
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
  }) {
    return TextStyle(
        fontSize: fontSize ?? 10,
        letterSpacing: letterSpacing ?? 0,
        color: color ?? DarkColorsPalate.tertiaryColor,
        fontFamily: 'SF Pro',
        fontWeight: fontWeight ?? FontWeight.w400);
  }

  TextStyle sensSerif({
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
  }) {
    return TextStyle(
        fontSize: fontSize ?? 10,
        letterSpacing: letterSpacing ?? 0,
        color: color ?? DarkColorsPalate.tertiaryColor,
        fontFamily: 'sensSerif',
        fontStyle: FontStyle.italic,
        fontWeight: fontWeight ?? FontWeight.w400);
  }

  ///sensSerif
}
