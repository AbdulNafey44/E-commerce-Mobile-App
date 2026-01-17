import 'package:flutter/material.dart';

class UColors {
  UColors._();

  // Palette Colors (from Image)
  static const Color colorBalticBlue = Color(0xFF2F6690);
  static const Color colorCerulean = Color(0xFF3A7CA5);
  static const Color colorAlabasterGrey = Color(0xFFD9DCD6);
  static const Color colorYaleBlue = Color(0xFF16425B);
  static const Color colorSkyBlue = Color(0xFF81C3D7);

  // Primary Color
  static const Color primary = Color(0xFF16425B);

  // Text colors
  static const Color textPrimary = colorYaleBlue; // Darkest blue for best readability
  static const Color textSecondary = Color(0xFF5A6266);
  static const Color textWhite = Colors.white;

  // Background colors
  static const Color light = Color(0xFFF4F5F3); // Tinted Alabaster for a clean look
  static const Color dark = colorYaleBlue;      // Using the deepest palette blue

  // Button colors
  static const Color buttonPrimary = colorBalticBlue;
  static const Color buttonDisabled = Color(0xFFAFB4B1); // Desaturated Alabaster

  // Border colors
  static const Color borderPrimary = colorAlabasterGrey;
  static const Color borderSecondary = Color(0xFFBCC0BA);

  // Error and validation colors
  static const Color error = Color(0xFFD32F2F);
  static const Color success = Color(0xFF388E3C);
  static const Color warning = Color(0xFFF57C00);
  static const Color info = colorSkyBlue; // Sky blue fits the "Info" profile perfectly

  static const Color yellow = Color(0xFFFFE24B);

  // Neutral Shades
  static const Color black = Color(0xFF0A1D29); // Darker shade of Yale Blue
  static const Color darkerGrey = Color(0xFF4F4F4F);
  static const Color darkGrey = Color(0xFF939393);
  static const Color grey = Color(0xFFE0E0E0);
  static const Color lightGrey = Color(0xFFF9F9F9);
  static const Color white = Color(0xFFFFFFFF);
}