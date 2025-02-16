import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static ThemeData lightTheme = FlexThemeData.light(
    fontFamily: 'Gotham',
    useMaterial3: true,
    scheme: FlexScheme.green,
    appBarStyle: FlexAppBarStyle.primary,
    tabBarStyle: FlexTabBarStyle.forAppBar,
    swapColors: true,
    subThemesData: const FlexSubThemesData(
      bottomAppBarSchemeColor: SchemeColor.primary,
    ),
    textTheme: TextTheme(
      bodySmall: TextStyle(fontSize: 14.sp),
      titleSmall: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.normal),
      titleMedium: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.normal),
      titleLarge: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.normal),
      labelSmall: TextStyle(fontSize: 8.sp, fontWeight: FontWeight.w400),
      labelMedium: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w400),
      labelLarge: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400),
    ),
  );

  static ThemeData darkTheme = FlexThemeData.dark(
    fontFamily: 'Gotham',
    useMaterial3: true,
    scheme: FlexScheme.bigStone,
    appBarStyle: FlexAppBarStyle.primary,
    tabBarStyle: FlexTabBarStyle.forAppBar,
    swapColors: true,
    appBarBackground: Colors.black,
    background: Colors.black,
    scaffoldBackground: Colors.black,
    subThemesData: const FlexSubThemesData(bottomAppBarSchemeColor: SchemeColor.primary),
    textTheme: TextTheme(
      bodySmall: TextStyle(fontSize: 14.sp),
      titleSmall: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.normal),
      titleMedium: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w400),
      titleLarge: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w700),
      labelSmall: TextStyle(fontSize: 8.sp, fontWeight: FontWeight.w400),
      labelMedium: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w400),
      labelLarge: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w400, overflow: TextOverflow.clip),
    ),
  );
}