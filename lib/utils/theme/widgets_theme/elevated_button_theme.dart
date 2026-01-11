import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';


class UElevatedButtonTheme {
  UElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: UColors.white,          // Button text color
      backgroundColor: UColors.primary,        // Baltic Blue
      disabledForegroundColor: UColors.darkGrey,
      disabledBackgroundColor: UColors.buttonDisabled, // Desaturated Alabaster
      side: const BorderSide(color: UColors.primary),
      padding: const EdgeInsets.symmetric(vertical: USizes.buttonHeight),
      textStyle: const TextStyle(fontSize: 16, color: UColors.white, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(USizes.buttonRadius)),
    ),
  );

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: UColors.white,
      backgroundColor: UColors.primary,        // Baltic Blue remains consistent
      disabledForegroundColor: UColors.darkGrey,
      disabledBackgroundColor: UColors.darkerGrey,
      // Dark mode mein border ko Sky Blue ya Primary rakh sakte hain highlight ke liye
      side: const BorderSide(color: UColors.colorSkyBlue),
      padding: const EdgeInsets.symmetric(vertical: USizes.buttonHeight),
      textStyle: const TextStyle(fontSize: 16, color: UColors.white, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(USizes.buttonRadius)),
    ),
  );
}