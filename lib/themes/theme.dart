import 'package:flutter/material.dart';

class AppTheme {
  static double getHeight(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    return height / devicePixelRatio;
  }

  static final ThemeData light = ThemeData.light().copyWith(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 0,
        backgroundColor: Colors.white,
        landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black26,
        // selectedIconTheme: IconThemeData(
        //   size: height*0.024
        // ),
        // unselectedIconTheme: IconThemeData(size: height*0.024),
        // selectedLabelStyle: TextStyle(fontSize: height*0.012),
        // unselectedLabelStyle: TextStyle(
        //   fontSize: height*0.012
        // ),
        enableFeedback: false),
  );
}
