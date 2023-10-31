import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sayfood/models/food.dart';
import 'package:sayfood/pages/main_screen.dart';
import 'package:sayfood/provider/cart_items_provider.dart';
import 'package:sayfood/styles/app_theme.dart';
import 'package:sayfood/styles/images.dart';
import 'package:sayfood/styles/strings.dart';
import 'package:sayfood/styles/styling.dart';
import 'package:sayfood/widgets/custom_rating_bar.dart';
import 'package:sayfood/widgets/reviews_list_tile.dart';
import 'package:velocity_x/velocity_x.dart';

class ProductPage extends StatefulWidget {
  static const String id = '/ProductPage';
  final Food? product;

  const ProductPage({super.key, this.product});
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  bool productNotEmpty = false;
  @override
  void initState() {
    super.initState();
    productNotEmpty = (widget.product != null);
  }

  @override
  Widget build(BuildContext context) {
    return MainPage(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child:
                        const Icon(Icons.close, color: Colors.grey, size: 25)),
                SvgPicture.asset(Images.roundedAFavIconOutlined),
              ],
            ),
            16.heightBox,
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                decoration: Styling.lightGreyDecoration(radius: 15),
                width: double.infinity,
                child: widget.product != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          widget.product!.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      )
                    : null,
              ),
            ).py(8),
            SizedBox(
              height: 50,
              width: (context.percentWidth * 100) - 48,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      children: [
                        for (int i = 0; i < 4; i++)
                          Container(
                            height: 50,
                            width: 50,
                            decoration: Styling.lightGreyDecoration(radius: 10),
                          ).px(4),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            16.heightBox,
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              leading: Container(
                height: 50,
                width: 50,
                decoration: Styling.lightGreyDecoration(radius: 10),
              ).px(4),
              title: Text(
                productNotEmpty ? widget.product!.category : Strings.vendorName,
                style: AppTheeme.normalSmallText,
              ),
              subtitle: Text(
                Strings.description,
                style: AppTheeme.normalSmallText.copyWith(color: Colors.grey),
              ),
              trailing: SizedBox(height: 20, child: CustomRatingBar(rating: 2)),
            ),
            const Text(Strings.productionDescription).px(5),
            32.heightBox,
            Consumer<CartItemsProvider>(builder:
                (BuildContext context, CartItemsProvider value, Widget? child) {
              return MaterialButton(
                  height: 45,
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                  color: Styling.darkGrey,
                  minWidth: double.infinity,
                  onPressed: () {
                    if (productNotEmpty) {
                      value.addToCart(widget.product!);
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Added to cart')));
                    }
                  },
                  child: (value.cartItems
                          .where((element) => element.id == widget.product!.id)
                          .isEmpty)
                      ? const Text(
                          Strings.addToCart,
                          style: AppTheeme.normalButtonTextWhite,
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MaterialButton(
                              padding: const EdgeInsets.all(0),
                              onPressed: () {
                                if (productNotEmpty) {
                                  value.addToCart(widget.product!);
                                }
                              },
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                            24.widthBox,
                            Container(
                              height: 30,
                              width: 30,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Text(
                                  value.cartItems
                                      .where((element) =>
                                          element.id == widget.product!.id)
                                      .length
                                      .toString(),
                                  style: AppTheeme.normalSmallText,
                                ),
                              ),
                            ),
                            24.widthBox,
                            MaterialButton(
                              padding: const EdgeInsets.all(0),
                              onPressed: () {
                                if (productNotEmpty) {
                                  value.removeFromCart(widget.product!);
                                }
                              },
                              child: SvgPicture.asset(
                                Images.deleteIcon,
                                color: Colors.white,
                                height: 20,
                              ),
                            ),
                          ],
                        ));
            }),
            const Text(Strings.itemDetails).py(16),
            if (widget.product != null) Text(widget.product!.description),
            16.heightBox,
            Row(
              children: [
                const Text(Strings.reviews),
                24.widthBox,
                CustomRatingBar(rating: 4),
                24.widthBox,
                const Text('(230)')
              ],
            ),
            ReviewListTile(
              name: Strings.name,
              date: '3 - nov - 2020',
              comment: Strings.comment,
              rating: 4,
            ),
            Divider(
              color: Colors.grey[400],
              thickness: 0.5,
              height: 2,
            ).px(8),
            ReviewListTile(
              name: Strings.name,
              date: '3 - nov - 2020',
              comment: Strings.comment,
              rating: 4,
            ),
          ],
        ).p(24),
      ),
    );
  }
}
