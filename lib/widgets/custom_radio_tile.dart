import 'package:flutter/material.dart';
import 'package:sayfood/styles/styling.dart';
import 'package:velocity_x/velocity_x.dart';

Widget customRadioTile(
    {bool isSelected = false,
    required String title,
    required int value,
    required Function() onTap,
    required int currentValue}) {
  return GestureDetector(
    onTap: onTap,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 80),
          height: 22,
          width: 22,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  color: ((currentValue == value) | isSelected)
                      ? Styling.mainPurple
                      : Colors.grey,
                  width: ((currentValue == value) | isSelected) ? 7 : 0.5)),
        ),
        8.widthBox,
        Text(title),
      ],
    ),
  );
}
