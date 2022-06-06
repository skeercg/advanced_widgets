import 'package:advanced_widgets/inherited_widget/app_theme.dart';
import 'package:flutter/material.dart';

final blackTheme = ThemeData(
  primarySwatch: primaryBlack,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      shape: MaterialStateProperty.all(const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)))),
      backgroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.disabled)) {
          return Colors.grey.withOpacity(0.5);
        }
        return Colors.grey;
      }),
      elevation: MaterialStateProperty.all(1),
      textStyle: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return const TextStyle(
              color: Colors.black,
              fontSize: 17,
              height: 22 / 17,
              fontWeight: FontWeight.w600,
            );
          }
          return const TextStyle(
            color: Colors.white,
            fontSize: 17,
            height: 22 / 17,
            fontWeight: FontWeight.w600,
          );
        },
      ),
      shadowColor: MaterialStateProperty.all(Colors.black38),
      padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(vertical: 11, horizontal: 16),
      ),
    ),
  ),
);
