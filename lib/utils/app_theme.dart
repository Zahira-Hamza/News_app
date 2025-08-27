import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_styles.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.whitePrimaryColor,
    primaryColor: AppColors.blackPrimaryColor,
    textTheme: TextTheme(
      headlineLarge: AppStyles.medium20black,
      displaySmall: AppStyles.bold16black,
      displayMedium: AppStyles.bold20black,
      headlineMedium: AppStyles.bold16black,
      displayLarge: AppStyles.medium24black,
      headlineSmall: AppStyles.bold14black,
      titleSmall: AppStyles.medium12black,
      titleMedium: AppStyles.bold16white,
      titleLarge: AppStyles.bold20white,
    ),

    ///app bar theme////////////////
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.whitePrimaryColor,
      iconTheme: IconThemeData(color: AppColors.blackPrimaryColor),
      centerTitle: true,
      titleTextStyle: AppStyles.bold16black,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.whitePrimaryColor,

    textTheme: TextTheme(
      headlineLarge: AppStyles.medium20white,
      displayMedium: AppStyles.bold20white,
      headlineSmall: AppStyles.bold14white,
      headlineMedium: AppStyles.bold16white,
      displayLarge: AppStyles.medium24white,
      displaySmall: AppStyles.bold16white,
      titleSmall: AppStyles.medium12white,
      titleMedium: AppStyles.bold16black,
      titleLarge: AppStyles.bold20black,
    ),
    scaffoldBackgroundColor: AppColors.blackPrimaryColor,

    ///app bar theme////////////////
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.blackPrimaryColor,
      iconTheme: IconThemeData(color: AppColors.whitePrimaryColor),
      centerTitle: true,
      titleTextStyle: AppStyles.bold16white,
    ),
  );
}
