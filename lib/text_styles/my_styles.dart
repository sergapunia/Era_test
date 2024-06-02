import 'package:flutter/material.dart';

class MyTextStyles {
  static TextStyle myTextStyle() {
    return const TextStyle(
        color: Colors.white,
        fontSize: 28,
        fontFamily: "SF-Pro",
        fontWeight: FontWeight.w200);
  }

  static TextStyle barStyle() {
    return const TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontFamily: "SF-Pro",
        fontWeight: FontWeight.w400);
  }

  static TextStyle subtitleStyle() {
    return const TextStyle(
      color: Colors.black38,
      fontSize: 12,
      fontFamily: "SF-Pro",
    );
  }

  static TextStyle latesTitles() {
    return const TextStyle(
      color: Colors.black,
      fontSize: 17,
      fontFamily: "SF-Pro",
    );
  }
}
