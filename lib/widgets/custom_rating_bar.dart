import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sayfood/styles/images.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomRatingBar extends StatefulWidget {
  CustomRatingBar({super.key, required this.rating});
  int rating = 1;
  @override
  _CustomRatingBarState createState() => _CustomRatingBarState();
}

class _CustomRatingBarState extends State<CustomRatingBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        (widget.rating > 0)
            ? SvgPicture.asset(Images.reviewStarFilled)
            : SvgPicture.asset(Images.reviewStarOutlined),
        2.widthBox,
        (widget.rating > 1)
            ? SvgPicture.asset(Images.reviewStarFilled)
            : SvgPicture.asset(Images.reviewStarOutlined),
        2.widthBox,
        (widget.rating > 2)
            ? SvgPicture.asset(Images.reviewStarFilled)
            : SvgPicture.asset(Images.reviewStarOutlined),
        2.widthBox,
        (widget.rating > 3)
            ? SvgPicture.asset(Images.reviewStarFilled)
            : SvgPicture.asset(Images.reviewStarOutlined),
        2.widthBox,
        (widget.rating > 4)
            ? SvgPicture.asset(Images.reviewStarFilled)
            : SvgPicture.asset(Images.reviewStarOutlined),
      ],
    );
  }
}
