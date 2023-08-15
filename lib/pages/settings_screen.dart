import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sayfood/pages/edit_profile.dart';
import 'package:sayfood/pages/main_screen.dart';
import 'package:sayfood/styles/app_theme.dart';
import 'package:sayfood/styles/images.dart';
import 'package:sayfood/styles/strings.dart';
import 'package:sayfood/styles/styling.dart';
import 'package:sayfood/widgets/new_products_vendors_appbar.dart';
import 'package:velocity_x/velocity_x.dart';

class SettingsScreen extends StatefulWidget {
  static const String id = '/SettingsScreen';

  const SettingsScreen({super.key});
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;
  @override
  Widget build(BuildContext context) {
    return MainPage(
      child: Column(
        children: [
          buildNewProductsAndVendorsAppbar(height: 45, title: Strings.settings),
          Container(
            decoration: Styling.lightGreyDecoration(radius: 25),
            child: Column(
              children: [
                ListTile(
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, EditProfileScreen.id);
                  },
                  leading: SvgPicture.asset(Images.person),
                  title: const Text(
                    '${Strings.name}, ${Strings.mobile}, ${Strings.mail}',
                    style: AppTheeme.normalButtonText,
                  ),
                  trailing: const IconButton(
                      icon: Icon(Icons.keyboard_arrow_right), onPressed: null),
                ),
                const Divider(
                  height: 8,
                  thickness: 1,
                ).px(16),
                ListTile(
                  onTap: () {},
                  leading: SvgPicture.asset(Images.profileLang),
                  title: const Text(
                    Strings.language,
                    style: AppTheeme.normalButtonText,
                  ),
                  trailing: DropdownButton(
                    onChanged: (val) {},
                    underline: const SizedBox(),
                    items: const [DropdownMenuItem(child: Text(Strings.english))],
                  ),
                ),
                ListTile(
                    onTap: () {},
                    leading: SvgPicture.asset(Images.profileRegion),
                    title: const Text(
                      Strings.country,
                      style: AppTheeme.normalButtonText,
                    ),
                    trailing: DropdownButton(
                      onChanged: (val) {},
                      underline: const SizedBox(),
                      items: const [DropdownMenuItem(child: Text(Strings.emirates))],
                    )),
                ListTile(
                    onTap: () {},
                    leading: SvgPicture.asset(Images.notificationIcon),
                    title: const Text(
                      Strings.notifications,
                      style: AppTheeme.normalButtonText,
                    ),
                    trailing: CupertinoSwitch(
                      value: _notificationsEnabled,
                      trackColor: Colors.black,
                      activeColor: Colors.black,
                      onChanged: (val) {
                        setState(() {
                          _notificationsEnabled = val;
                        });
                      },
                    )),
              ],
            ).p(8),
          ).p(24)
        ],
      ),
    );
  }
}
