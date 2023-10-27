import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sayfood/pages/main_screen.dart';
import 'package:sayfood/styles/app_theme.dart';
import 'package:sayfood/styles/images.dart';
import 'package:sayfood/styles/strings.dart';
import 'package:sayfood/styles/styling.dart';
import 'package:sayfood/widgets/new_products_vendors_appbar.dart';
import 'package:velocity_x/velocity_x.dart';

class EditProfileScreen extends StatelessWidget {
  static const String id = '/EditProfile';

  const EditProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return MainPage(
        child: Column(children: [
      Column(
        children: [
          buildNewProductsAndVendorsAppbar(height: 45, title: Strings.profile),
          24.heightBox,
          CircleAvatar(
            radius: 45,
            backgroundColor: Styling.lightGrey,
            child: SvgPicture.asset(Images.person,
                color: Styling.lighterDarkGrey, height: 55),
          ),
          Container(
            decoration: Styling.lightGreyDecoration(radius: 25),
            child: Column(
              children: [
                _buildProfileItemRow(
                    leadingText: Strings.fullName,
                    middleText: Strings.userName,
                    onTap: () {}),
                const Divider(
                  height: 8,
                  thickness: 1,
                ).px(16),
                _buildProfileItemRow(
                    leadingText: Strings.mobile,
                    middleText: '########',
                    trailingText: Strings.changeNumber),
                const Divider(
                  height: 8,
                  thickness: 1,
                ).px(16),
                _buildProfileItemRow(
                    leadingText: Strings.email, middleText: Strings.userMail),
              ],
            ).p(8),
          ).p(24)
        ],
      ),
    ]));
  }

  Widget _buildProfileItemRow(
      {required String leadingText,
      required String middleText,
      String? trailingText,
      Function()? onTap}) {
    return ListTile(
      onTap: onTap,
      title: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              leadingText,
              style: AppTheeme.normalButtonText,
            ),
          ),
          const Expanded(
            flex: 1,
            child: SizedBox(),
          ),
          Expanded(
            flex: 4,
            child: Text(
              middleText,
              style: AppTheeme.normalButtonText,
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              trailingText ?? '',
              style: AppTheeme.normalSmallText.copyWith(color: Colors.green),
            ),
          ),
        ],
      ).pOnly(left: 16),
    );
  }
}
