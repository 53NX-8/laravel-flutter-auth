import 'package:flutter/material.dart';
import 'package:flutter_app/src/utils/constants/palette.dart';

class AppTheme {
  static _border([Color color = Palette.grey5]) => OutlineInputBorder(
        borderSide: BorderSide(
          color: color,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(10),
      );

  static final appTheme = ThemeData.light().copyWith(
      scaffoldBackgroundColor: Palette.grey1,
      appBarTheme: const AppBarTheme(
        backgroundColor: Palette.white,
      ),
      chipTheme: const ChipThemeData(
        color: MaterialStatePropertyAll(
          Palette.white,
        ),
        side: BorderSide.none,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              elevation: 0,
              foregroundColor: Palette.white,
              backgroundColor: Palette.grey8,
              disabledForegroundColor: Palette.grey5,
              disabledBackgroundColor: Palette.grey6,
              side: const BorderSide(color: Palette.grey8),
              padding: const EdgeInsets.symmetric(vertical: 18),
              textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Palette.white),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)))),
      inputDecorationTheme: InputDecorationTheme(
        errorMaxLines: 3,
        prefixIconColor: Palette.grey5,
        suffixIconColor: Palette.grey5,
        labelStyle:
            const TextStyle().copyWith(fontSize: 14, color: Palette.grey7),
        hintStyle:
            const TextStyle().copyWith(fontSize: 14, color: Palette.grey7),
        errorStyle: const TextStyle().copyWith(fontSize: 12),
        floatingLabelStyle:
            const TextStyle().copyWith(color: Palette.grey8.withOpacity(0.8)),
        border: const OutlineInputBorder().copyWith(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(width: 1, color: Palette.grey4)),
        enabledBorder: const OutlineInputBorder().copyWith(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(width: 1, color: Palette.grey4)),
        focusedBorder: const OutlineInputBorder().copyWith(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(width: 1, color: Palette.grey4)),
        errorBorder: const OutlineInputBorder().copyWith(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(width: 1, color: Palette.error)),
        focusedErrorBorder: const OutlineInputBorder().copyWith(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(width: 1, color: Palette.warning)),
      ),
      textTheme: TextTheme(
        titleLarge: const TextStyle().copyWith(
            fontSize: 24.0, fontWeight: FontWeight.w700, color: Palette.grey7),
        bodyLarge: const TextStyle().copyWith(
            fontSize: 16.0, fontWeight: FontWeight.w400, color: Palette.grey7),
        bodyMedium: const TextStyle().copyWith(
            fontSize: 16.0,
            fontWeight: FontWeight.normal,
            color: Palette.grey6),
      ));
}
