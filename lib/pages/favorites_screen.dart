import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sayfood/pages/browse_favorites.dart';
import 'package:sayfood/pages/main_screen.dart';
import 'package:sayfood/styles/app_theme.dart';
import 'package:sayfood/styles/images.dart';
import 'package:sayfood/styles/strings.dart';
import 'package:sayfood/styles/styling.dart';
import 'package:sayfood/widgets/new_products_vendors_appbar.dart';
import 'package:velocity_x/velocity_x.dart';

class FavoritesScreen extends StatelessWidget {
  static const String id = '/FavoritesScreen';

  const FavoritesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return MainPage(
      child: Column(
        children: [
          buildNewProductsAndVendorsAppbar(
              height: 50, title: Strings.favorites),
          Expanded(
              child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(Images.favIcon),
                24.heightBox,
                const Text(
                  Strings.favoritesEmpty,
                  style: AppTheeme.largeText,
                ),
                8.heightBox,
                const Text(
                  Strings.favoritesEmptyDesc,
                  style: AppTheeme.normalSmallText,
                ),
                16.heightBox,
                _buildBrowseProductButton(context)
              ],
            ),
          ))
        ],
      ),
    );
  }

  Widget _buildBrowseProductButton(context) {
    return MaterialButton(
      height: 40,
      minWidth: 120,
      color: Styling.darkGrey,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      onPressed: () {
        Navigator.pushReplacementNamed(context, BrowseFavorites.id);
      },
      child: Text(
        Strings.browseProduct,
        style: AppTheeme.largeText.copyWith(color: Colors.white),
      ).p(5),
    );
  }
}
