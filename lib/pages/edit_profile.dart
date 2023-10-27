import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sayfood/models/user.dart';
import 'package:sayfood/pages/main_screen.dart';
import 'package:sayfood/styles/app_theme.dart';
import 'package:sayfood/styles/images.dart';
import 'package:sayfood/styles/strings.dart';
import 'package:sayfood/styles/styling.dart';
import 'package:sayfood/utils/firebase_services.dart';
import 'package:sayfood/widgets/new_products_vendors_appbar.dart';
import 'package:velocity_x/velocity_x.dart';

class EditProfileScreen extends StatefulWidget {
  static const String id = '/EditProfile';

  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  SFUser user = const SFUser(
      uid: '0',
      email: 'Fetching...',
      name: 'Loading...',
      phone: 'Fetching...',
      profileImageUrl: '',
      createdAt: 243,
      updatedAt: 23424,
      isActive: true,
      dob: 2,
      points: 0,
      permisions: [],
      favorites: []);
  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  loadUserData() async {
    user = await FirebaseServices.fetchUserData(
            FirebaseAuth.instance.currentUser!.uid) ??
        const SFUser(
            uid: '0',
            email: 'example@gmail.com',
            name: 'Loading',
            phone: 'Fetching...',
            profileImageUrl: '',
            createdAt: 243,
            updatedAt: 23424,
            isActive: true,
            dob: 2,
            points: 0,
            permisions: [],
            favorites: []);
    setState(() {});
  }

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
                    middleText: user.name,
                    onTap: () {}),
                const Divider(
                  height: 8,
                  thickness: 1,
                ).px(16),
                _buildProfileItemRow(
                    leadingText: Strings.mobile,
                    middleText: user.phone,
                    trailingText: Strings.changeNumber),
                const Divider(
                  height: 8,
                  thickness: 1,
                ).px(16),
                _buildProfileItemRow(
                    leadingText: Strings.email, middleText: user.email),
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
