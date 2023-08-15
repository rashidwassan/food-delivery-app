import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sayfood/styles/app_theme.dart';
import 'package:sayfood/styles/images.dart';
import 'package:sayfood/styles/styling.dart';
import 'package:sayfood/widgets/custom_rating_bar.dart';

class ReviewListTile extends StatelessWidget {
  ReviewListTile(
      {super.key,
      required this.name,
      required this.date,
      required this.comment,
      required this.rating});
  String name;
  String date;
  String comment;
  int rating;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.all(0),
          leading: CircleAvatar(
            backgroundColor: Styling.lightGrey,
            child: SvgPicture.asset(
              Images.person,
              color: Styling.lighterDarkGrey,
            ),
          ),
          title: Text(
            name,
            style: AppTheeme.normalSmallerButtonText,
          ),
          subtitle: Text(
            date,
            style: AppTheeme.subtitleSmallText,
          ),
          trailing: CustomRatingBar(rating: rating),
        ),
        ListTile(
          dense: true,
          contentPadding: const EdgeInsets.all(0),
          leading: const SizedBox(),
          title: Text(
            comment,
            style: AppTheeme.subtitleSmallText,
          ),
        ),
      ],
    );
  }
}
