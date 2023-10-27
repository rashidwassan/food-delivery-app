import 'package:flutter/material.dart';
import 'package:sayfood/styles/styling.dart';
import 'package:velocity_x/velocity_x.dart';

// ignore: must_be_immutable
class SwiperDotsIndicator extends StatelessWidget {
  SwiperDotsIndicator(this.currentIndex, {super.key});
  int currentIndex;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _dot((currentIndex == 0) ? true : false),
        _dot((currentIndex == 1) ? true : false),
        _dot((currentIndex == 2) ? true : false),
        _dot((currentIndex == 3) ? true : false),
        _dot((currentIndex == 4) ? true : false),
      ],
    );
  }

  _dot(isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      height: 8,
      width: 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: (isActive) ? Styling.darkGrey : Styling.lighterDarkGrey,
      ),
    ).px(6);
  }
}
