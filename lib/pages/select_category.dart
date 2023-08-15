import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sayfood/styles/app_theme.dart';
import 'package:sayfood/styles/images.dart';
import 'package:sayfood/styles/strings.dart';
import 'package:sayfood/styles/styling.dart';
import 'package:velocity_x/velocity_x.dart';

class SelectCategory extends StatelessWidget {
  const SelectCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            _buildUpperContainer(context),
            _buildLowerContainer(context),
          ],
        ),
      ),
    );
  }

  SizedBox _buildUpperContainer(BuildContext context) {
    return SizedBox(
      height: context.percentHeight * 23,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              Strings.selectCategory,
              style: AppTheeme.largeText,
            ),
            16.heightBox,
            const Text(
              Strings.selectCategorySubtitle,
              style: AppTheeme.subtitleSmallText,
            ),
          ],
        ).pOnly(top: 32),
      ),
    );
  }

  Widget _buildLowerContainer(BuildContext context) {
    return Expanded(
      child: Container(
        color: Styling.mainYellow,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              32.heightBox,
              Expanded(
                flex: 4,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/MainPage');
                  },
                  child: SvgPicture.asset(Images.eCommerceCategoryIcon),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(),
              ),
              Expanded(
                flex: 4,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/MainPage');
                  },
                  child: SvgPicture.asset(Images.foodCategoryIcon),
                ),
              ),
              48.heightBox,
            ],
          ),
        ),
      ),
    );
  }
}
