import 'package:advanced_widgets/inherited_widget/app_theme.dart';
import 'package:advanced_widgets/inherited_widget/black_theme.dart';
import 'package:advanced_widgets/inherited_widget/blue_theme.dart';
import 'package:advanced_widgets/inherited_widget/green_theme.dart';
import 'package:advanced_widgets/inherited_widget/purple_theme.dart';
import 'package:advanced_widgets/inherited_widget/red_theme.dart';
import 'package:advanced_widgets/presentation/pages/main_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppTheme(
      themeDataPurple: purpleTheme,
      themeDataRed: redTheme,
      themeDataBlack: blackTheme,
      themeDataGreen: greenTheme,
      themeDataBlue: blueTheme,
      child: MaterialApp(
        title: 'Flutter Demo',
        home: Builder(
          builder: (context) => MainPage(),
        ),
      ),
    );
  }
}
