import 'package:flutter/material.dart';
import 'package:sayfood/styles/app_theme.dart';
import 'package:sayfood/styles/styling.dart';

Widget buildNewProductsAndVendorsAppbar(
    {required String title, double height = 35}) {
  return AppBar(
    backgroundColor: Styling.lightGrey,
    iconTheme: const IconThemeData(color: Styling.lighterDarkGrey),
    title: Text(
      title,
      style: AppTheeme.newProductsAndVendorsTitleFont,
    ),
    centerTitle: true,
    toolbarHeight: height,
  );
}

Widget buildNotificationsTitleBar(
    {required String title,
    double height = 35,
    required BuildContext context}) {
  return AppBar(
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(
        Icons.close,
        size: 30,
        color: Styling.darkGrey,
      ),
    ),
    backgroundColor: Styling.lightGrey,
    iconTheme: const IconThemeData(color: Styling.lighterDarkGrey),
    title: Text(
      title,
      style: AppTheeme.newProductsAndVendorsTitleFont,
    ),
    centerTitle: true,
    toolbarHeight: height,
  );
}
