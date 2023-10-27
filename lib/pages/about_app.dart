import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sayfood/pages/main_screen.dart';
import 'package:sayfood/styles/app_theme.dart';
import 'package:sayfood/styles/images.dart';
import 'package:sayfood/styles/strings.dart';
import 'package:sayfood/styles/styling.dart';
import 'package:sayfood/widgets/new_products_vendors_appbar.dart';
import 'package:velocity_x/velocity_x.dart';

class AboutAppScreen extends StatelessWidget {
  static const String id = '/AboutScreen';

  const AboutAppScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return MainPage(
      child: Column(
        children: [
          buildNewProductsAndVendorsAppbar(height: 45, title: Strings.about),
          Container(
            decoration: Styling.lightGreyDecoration(radius: 25),
            child: Column(
              children: [
                ListTile(
                    onTap: () {},
                    leading: SvgPicture.asset(Images.appBuild),
                    title: const Text(
                      Strings.appBuild,
                      style: AppTheeme.normalButtonText,
                    ),
                    trailing: const Text('1.3')),
                const Divider(
                  height: 8,
                  thickness: 1,
                ).px(16),
                ListTile(
                  onTap: () {},
                  leading: SvgPicture.asset(Images.userAgreement),
                  title: const Text(
                    Strings.userAgreement,
                    style: AppTheeme.normalButtonText,
                  ),
                ),
                const Divider(
                  height: 8,
                  thickness: 1,
                ).px(16),
                ListTile(
                  onTap: () {},
                  leading: SvgPicture.asset(Images.twitterIcon),
                  title: const Text(
                    Strings.twitter,
                    style: AppTheeme.normalButtonText,
                  ),
                ),
                const Divider(
                  height: 8,
                  thickness: 1,
                ).px(16),
                ListTile(
                  onTap: () {},
                  leading: SvgPicture.asset(Images.instaIcon),
                  title: const Text(
                    Strings.instagram,
                    style: AppTheeme.normalButtonText,
                  ),
                ),
              ],
            ).p(8),
          ).p(24)
        ],
      ),
    );
  }
}
