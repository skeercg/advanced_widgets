import 'package:flutter/material.dart';

class AppTheme extends InheritedWidget {
  AppTheme({
    Key? key,
    required super.child,
    required this.themeDataPurple,
    required this.themeDataGreen,
    required this.themeDataRed,
    required this.themeDataBlack,
    required this.themeDataBlue,
  }) : super(key: key);

  ThemeDataType type = ThemeDataType.purple;
  final ThemeData themeDataPurple;
  final ThemeData themeDataGreen;
  final ThemeData themeDataRed;
  final ThemeData themeDataBlack;
  final ThemeData themeDataBlue;

  static void setType(BuildContext context, ThemeDataType newType) {
    final result = context.dependOnInheritedWidgetOfExactType<AppTheme>();
    assert(result != null);
    result!.type = newType;
  }

  static ThemeDataType getType(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<AppTheme>();
    assert(result != null);
    return result!.type;
  }

  static ThemeData of(BuildContext context, ThemeDataType type) {
    final result = context.dependOnInheritedWidgetOfExactType<AppTheme>();
    assert(result != null);
    switch (type) {
      case ThemeDataType.purple:
        return result!.themeDataPurple;
      case ThemeDataType.green:
        return result!.themeDataGreen;
      case ThemeDataType.red:
        return result!.themeDataRed;
      case ThemeDataType.black:
        return result!.themeDataBlack;
      case ThemeDataType.blue:
        return result!.themeDataBlue;
    }
  }

  @override
  bool updateShouldNotify(covariant AppTheme oldWidget) {
    return oldWidget.type != type;
  }
}

enum ThemeDataType {
  green,
  purple,
  red,
  blue,
  black,
}

const MaterialColor primaryBlack = MaterialColor(
  _blackPrimaryValue,
  <int, Color>{
    50: Color(0xFF000000),
    100: Color(0xFF000000),
    200: Color(0xFF000000),
    300: Color(0xFF000000),
    400: Color(0xFF000000),
    500: Color(_blackPrimaryValue),
    600: Color(0xFF000000),
    700: Color(0xFF000000),
    800: Color(0xFF000000),
    900: Color(0xFF000000),
  },
);
const int _blackPrimaryValue = 0xFF000000;

ButtonStyle getButtonTheme(ThemeData themeData) => ButtonStyle(
      backgroundColor: themeData.elevatedButtonTheme.style?.backgroundColor,
      shadowColor: themeData.elevatedButtonTheme.style?.shadowColor,
      elevation: themeData.elevatedButtonTheme.style?.elevation,
      textStyle: themeData.elevatedButtonTheme.style?.textStyle,
    );
