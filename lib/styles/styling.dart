import 'package:flutter/material.dart';

class Styling {
  Styling._();

  static const Color mainYellow = Color(0xfffbb814);
  static const Color darkGrey = Color(0xff575757);
  static const Color lighterDarkGrey = Color(0xffE4E4E4);
  static const Color lightGrey = Color(0xffF7F8F9);
  static const Color blackLight = Color(0xff1C1C1C);

  static BoxDecoration lightGreyDecoration({required double radius}) {
    return BoxDecoration(
        color: Styling.lightGrey,
        borderRadius: BorderRadiusDirectional.circular(radius));
  }
}
