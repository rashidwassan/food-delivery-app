import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sayfood/pages/main_screen.dart';
import 'package:sayfood/styles/app_theme.dart';
import 'package:sayfood/styles/images.dart';
import 'package:sayfood/styles/strings.dart';
import 'package:sayfood/styles/styling.dart';
import 'package:sayfood/widgets/custom_rating_bar.dart';
import 'package:sayfood/widgets/reviews_list_tile.dart';
import 'package:velocity_x/velocity_x.dart';

class ProductPage extends StatefulWidget {
  static const String id = '/ProductPage';

  const ProductPage({super.key});
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int _cartItems = 0;
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
                const Icon(Icons.close, color: Colors.grey, size: 25),
                SvgPicture.asset(Images.roundedAFavIconOutlined),
              ],
            ),
            16.heightBox,
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                decoration: Styling.lightGreyDecoration(radius: 15),
                width: double.infinity,
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
              title: const Text(
                Strings.vendorName,
                style: AppTheeme.normalSmallText,
              ),
              subtitle: Text(
                Strings.description,
                style: AppTheeme.normalSmallText.copyWith(color: Colors.grey),
              ),
              trailing:
                  SizedBox(height: 20, child: CustomRatingBar(rating: 2)),
            ),
            const Text(Strings.productionDescription).px(5),
            32.heightBox,
            MaterialButton(
                height: 35,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)),
                color: Styling.darkGrey,
                minWidth: double.infinity,
                onPressed: () {
                  setState(() {
                    _cartItems++;
                  });
                },
                child: (_cartItems == 0)
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
                              setState(() {
                                _cartItems++;
                              });
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
                                _cartItems.toString(),
                                style: AppTheeme.normalSmallText,
                              ),
                            ),
                          ),
                          24.widthBox,
                          MaterialButton(
                            padding: const EdgeInsets.all(0),
                            onPressed: () {
                              setState(() {
                                _cartItems--;
                              });
                            },
                            child: SvgPicture.asset(
                              Images.deleteIcon,
                              color: Colors.white,
                              height: 20,
                            ),
                          ),
                        ],
                      )),
            const Text(Strings.itemDetails).py(16),
            const Text('-\n-\n-\n-\n'),
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
