import 'package:flutter/material.dart';

class ThemeConfiguration {
  static const Color promoOrangeColor = Colors.orange;
  static const Color fontTextColor = Color(0xff333131);
  static const Color incDncButtonColor = Color(0xffF3F3F3);

  //App Color Pallets
  static const Color themePrimaryColor = Color(0xffE51937);
  static const Color themeAppOfferColor = Color(0xffFFAA05);
  static const Color lightSeaGreen = Color(0xff18a2ab);
  static const Color themeDarkColor = Color(0xff1F1F1F);
  static const Color themeDarkLightColor = Color(0xff4A4A4A);
  static const Color themeDarkAccentColor = Color(0xff8C8C8C);
  static const Color themeLightDarkColor = Color(0xffe1e3e5);
  static const Color themeLightAccentColor = Color(0xffEFEFEF);

  // Text field back ground color
  static const Color textFieldBackgroundColor = Color(0xffFAFAFA);

  static ThemeData Function(BuildContext context) defaultTheme =
      (BuildContext context) => ThemeData(
          buttonTheme: ButtonThemeData(buttonColor: themePrimaryColor),
          cardTheme: CardTheme(
              margin: EdgeInsets.all(0),
              elevation: .5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(0.0)))),
          scaffoldBackgroundColor: Colors.white,
          primaryColor: themePrimaryColor,
          textTheme: TextTheme(
            // ignore: deprecated_member_use
            title: TextStyle(fontSize: 20), //72
            // ignore: deprecated_member_use
            display1: TextStyle(fontSize: 18), //60
            // ignore: deprecated_member_use
            display2: TextStyle(fontSize: 16), // 48
            // ignore: deprecated_member_use
            display3: TextStyle(fontSize: 14), // 42
            // ignore: deprecated_member_use
            display4: TextStyle(fontSize: 12), // 36
          ),
          buttonColor: themePrimaryColor,
          iconTheme: IconThemeData(color: Colors.black87),
          appBarTheme: AppBarTheme(
              iconTheme: IconThemeData(color: themeDarkColor),
              elevation: 0.8,
              color: Colors.white,
              textTheme: TextTheme(
                  // ignore: deprecated_member_use
                  title: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: ThemeConfiguration.themeDarkColor,
              ))),
          primaryIconTheme: IconThemeData(color: themeDarkColor));
}
