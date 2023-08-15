import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sayfood/pages/main_screen.dart';
import 'package:sayfood/styles/app_theme.dart';
import 'package:sayfood/styles/images.dart';
import 'package:sayfood/styles/strings.dart';
import 'package:sayfood/styles/styling.dart';
import 'package:sayfood/widgets/new_products_vendors_appbar.dart';
import 'package:velocity_x/velocity_x.dart';

class BrowseFavorites extends StatelessWidget {
  static const String id = '/BrowseFavorites';

  const BrowseFavorites({super.key});
  @override
  Widget build(BuildContext context) {
    return MainPage(
      child: Column(
        children: [
          buildNewProductsAndVendorsAppbar(
              height: 50, title: Strings.favorites),
          24.heightBox,
          _buildFavoritesGrid()
        ],
      ),
    );
  }

  Widget _buildFavoritesGrid() {
    return Expanded(
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: 11,
        gridDelegate: _categoriesScreenGrids,
        itemBuilder: (context, index) {
          return Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Container(
                      decoration: Styling.lightGreyDecoration(radius: 20),
                      child: SizedBox(
                        width: context.percentWidth * 42,
                        height: 100,
                      ),
                    ).p(8),
                    SvgPicture.asset(Images.roundedAFavIconFilled),
                  ],
                ).p(12),
                const Text(
                  Strings.aedPrice,
                  textAlign: TextAlign.start,
                  style: AppTheeme.normalSmallText,
                ),
                const Text(
                  Strings.brandAndProduct + "+  " + '500',
                  textAlign: TextAlign.start,
                  style: AppTheeme.normalSmallText,
                ),
                _buildAddToCartButton(context)
              ],
            ),
          );
        },
      ).px(24),
    );
  }

  Widget _buildAddToCartButton(context) {
    return SizedBox(
      height: 25,
      child: RawMaterialButton(
        fillColor: Styling.darkGrey,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(Images.cartIconWhite),
            3.widthBox,
            Text(
              Strings.addToCart,
              style: AppTheeme.normalSmallText.copyWith(color: Colors.white),
            ).p(5),
          ],
        ),
      ),
    );
  }

  final SliverGridDelegateWithFixedCrossAxisCount _categoriesScreenGrids =
      const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    childAspectRatio: 0.8,
    crossAxisSpacing: 24,
    mainAxisSpacing: 24,
  );
}
