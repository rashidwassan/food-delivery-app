import 'package:flutter/material.dart';
import 'package:sayfood/styles/app_theme.dart';
import 'package:sayfood/styles/styling.dart';

Widget capsuleShape({Color color = Styling.lightGrey, required Widget child}) {
  return ClipRRect(
    borderRadius:
        BorderRadius.circular(AppTheeme.capsuleButtonAndContainerHeight / 2),
    child: Container(
      height: AppTheeme.capsuleButtonAndContainerHeight,
      width: double.infinity,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(
              AppTheeme.capsuleButtonAndContainerHeight / 2)),
      child: child,
    ),
  );
}
