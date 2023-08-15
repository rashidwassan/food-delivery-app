import 'package:flutter/material.dart';

class AppTheeme {
  AppTheeme._();

  static const TextStyle normalButtonText =
      TextStyle(fontSize: 15, fontWeight: FontWeight.w400);
  static const TextStyle normalSmallerButtonText =
      TextStyle(fontSize: 14, fontWeight: FontWeight.w400);
  static const TextStyle normalSmallerButtonTextSemibold =
      TextStyle(fontSize: 14, fontWeight: FontWeight.w500);

  static const TextStyle normalButtonTextWhite =
      TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.w400);
  static const TextStyle cartCheckoutBottomCardFont = TextStyle(
    fontSize: 15,
    color: Colors.black,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle largeText =
      TextStyle(fontSize: 20, fontWeight: FontWeight.w400);

  static const TextStyle subtitleSmallText =
      TextStyle(fontSize: 11, fontWeight: FontWeight.w600);
  static const TextStyle normalSmallText =
      TextStyle(fontSize: 11, fontWeight: FontWeight.w400, color: Colors.black);
  static const TextStyle normalSmallTextRed = TextStyle(
      fontSize: 11, fontWeight: FontWeight.w400, color: Color(0xFFFF0000));
  static const TextStyle normalMediumSmallText =
      TextStyle(fontSize: 16, fontWeight: FontWeight.w300);
  static const TextStyle normalSmallLined = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.lineThrough,
  );

  static const TextStyle homePageSmallText = TextStyle(fontSize: 11);
  static const TextStyle notificationsStatusText = TextStyle(fontSize: 13);

  static const TextStyle homePageDealsText =
      TextStyle(fontSize: 16, fontWeight: FontWeight.w300);
  static const TextStyle productListTitleFont =
      TextStyle(fontSize: 19, fontWeight: FontWeight.w500);
  static const TextStyle newProductsAndVendorsTitleFont =
      TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black);

  static const double capsuleButtonAndContainerHeight = 70;
}
