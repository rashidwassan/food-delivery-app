import 'package:flutter/material.dart';
import 'package:sayfood/styles/app_theme.dart';
import 'package:sayfood/styles/styling.dart';

Widget buildDealsViewWithBottomTitle(
    {required String title, String? imagePath}) {
  return Stack(
    alignment: Alignment.bottomCenter,
    children: [
      Container(
        decoration: BoxDecoration(
          color: Styling.lightGrey,
          borderRadius: BorderRadius.circular(15),
          image: (imagePath == null)
              ? null
              : DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(imagePath),
                ),
        ),
      ),
      Container(
        decoration: const BoxDecoration(
            color: Styling.lighterDarkGrey,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            )),
        height: 25,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: AppTheeme.homePageDealsText,
            ),
          ],
        ),
      )
    ],
  );
}
