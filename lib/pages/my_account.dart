import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sayfood/pages/about_app.dart';
import 'package:sayfood/pages/delivery_addresses.dart';
import 'package:sayfood/pages/favorites_screen.dart';
import 'package:sayfood/pages/help_screen.dart';
import 'package:sayfood/pages/my_orders.dart';
import 'package:sayfood/pages/settings_screen.dart';
import 'package:sayfood/styles/app_theme.dart';
import 'package:sayfood/styles/images.dart';
import 'package:sayfood/styles/strings.dart';
import 'package:sayfood/styles/styling.dart';
import 'package:sayfood/utils/firebase_services.dart';
import 'package:sayfood/widgets/new_products_vendors_appbar.dart';
import 'package:velocity_x/velocity_x.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          buildNewProductsAndVendorsAppbar(
              height: 45,
              title: FirebaseAuth.instance.currentUser!.displayName ?? ''),
          16.heightBox,
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                _buildFollowerStatusRow(),
                32.heightBox,
                _buildProfileScreenRow(
                    icon: Images.myOrders,
                    title: Strings.myOrders,
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, MyOrdersScreen.id);
                    }),
                12.heightBox,
                _buildProfileScreenRow(
                    icon: Images.favourite,
                    title: Strings.favorite,
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, FavoritesScreen.id);
                    }),
                12.heightBox,
                _buildProfileScreenRow(
                    icon: Images.settings,
                    title: Strings.settings,
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, SettingsScreen.id);
                    }),
                12.heightBox,
                _buildProfileScreenRow(
                    icon: Images.help,
                    title: Strings.help,
                    onTap: () {
                      Navigator.pushReplacementNamed(context, HelpScreen.id);
                    }),
                12.heightBox,
                _buildProfileScreenRow(
                    icon: Images.about,
                    title: Strings.about,
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, AboutAppScreen.id);
                    }),
                12.heightBox,
                _buildProfileScreenRow(
                    icon: Images.rateApplication,
                    title: Strings.rateApplication,
                    onTap: () {}),
                16.heightBox,
                _buildLogoutButton(buildContext: context)
              ],
            ).p(24),
          ),
        ],
      ),
    );
  }

  Widget _buildLogoutButton({required BuildContext buildContext}) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Styling.blackLight,
      height: 60,
      onPressed: () {
        FirebaseServices.signOut();
        Navigator.pushReplacementNamed(buildContext, '/SignUp');
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(Images.logout),
          8.widthBox,
          Text(
            Strings.logout,
            style: AppTheeme.productListTitleFont.copyWith(color: Colors.white),
          )
        ],
      ),
    );
  }

  Widget _buildProfileScreenRow(
      {required String icon, required String title, Function()? onTap}) {
    return MaterialButton(
      height: 60,
      color: Styling.lightGrey,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      onPressed: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(icon),
          24.widthBox,
          Text(
            title,
            style: AppTheeme.newProductsAndVendorsTitleFont,
          )
        ],
      ).px(24),
    );
  }

  SizedBox _buildFollowerStatusRow() {
    return SizedBox(
      height: 45,
      child: Row(
        children: [
          _buildFollowerButton(text: Strings.followers),
          16.widthBox,
          _buildFollowerButton(text: Strings.following),
        ],
      ),
    );
  }

  Expanded _buildFollowerButton({required String text}) {
    return Expanded(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        decoration: BoxDecoration(
            color: Styling.mainPurple, borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(
            text,
            style: AppTheeme.normalSmallerButtonText,
          ),
        ),
      ),
    );
  }
}
