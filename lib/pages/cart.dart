import 'package:flutter/material.dart';
import 'package:sayfood/pages/checkout.dart';
import 'package:sayfood/styles/app_theme.dart';
import 'package:sayfood/styles/strings.dart';
import 'package:sayfood/styles/styling.dart';
import 'package:sayfood/widgets/new_products_vendors_appbar.dart';
import 'package:velocity_x/velocity_x.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildNewProductsAndVendorsAppbar(height: 45, title: Strings.cart),
        Expanded(
          child: ScrollConfiguration(
            behavior: const ScrollBehavior(),
            child: ListView.builder(
              itemCount: 6,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    _buildCartItemRow(),
                    (index == 3)
                        ? Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                MaterialButton(
                                  height: 35,
                                  color: Styling.lightGrey,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  onPressed: () {},
                                  child: const Text(
                                    Strings.cancel,
                                    style: AppTheeme.normalSmallText,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : const SizedBox.shrink()
                  ],
                );
              },
            ).px(24).pOnly(bottom: 4),
          ),
        ),
        Container(
          height: 65,
          decoration: const BoxDecoration(color: Styling.lightGrey),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      Strings.youSaved,
                      style: AppTheeme.normalSmallTextRed,
                    ),
                    4.heightBox,
                    const Text(
                      Strings.aedPrice,
                      style: AppTheeme.normalSmallTextRed,
                    ),
                  ],
                ),
              ),
              Container(
                color: Styling.darkGrey,
                child: const SizedBox(
                  height: 35,
                  width: 0.3,
                ),
              ).px(16),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      Strings.total,
                      style: AppTheeme.normalSmallText,
                    ),
                    4.heightBox,
                    const Text(
                      Strings.aedPrice,
                      style: AppTheeme.normalSmallText,
                    ),
                  ],
                ),
              ),
              const Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              Expanded(
                flex: 3,
                child: MaterialButton(
                  height: 40,
                  color: Styling.darkGrey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  onPressed: () {
                    Navigator.pushNamed(context, CheckoutScreen.id);
                  },
                  child: const Text(
                    Strings.checkout,
                    style: AppTheeme.normalButtonTextWhite,
                  ),
                ),
              )
            ],
          ).px(24),
        ),
        8.heightBox
      ],
    );
  }

  Widget _buildCartItemRow() {
    return SizedBox(
      height: 80,
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 1.2,
            child: Container(
                decoration: Styling.lightGreyDecoration(radius: 25),
                child: Container()),
          ),
          8.widthBox,
          Expanded(
            child: Container(
              decoration: Styling.lightGreyDecoration(radius: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "${Strings.brandAndProduct}+\t\t\t500 G",
                    style: AppTheeme.normalSmallText,
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      const Expanded(
                        flex: 4,
                        child: Text(
                          Strings.aedPrice,
                          style: AppTheeme.normalSmallText,
                        ),
                      ),
                      const Expanded(
                        flex: 1,
                        child: Text(
                          "X",
                          style: AppTheeme.normalSmallText,
                        ),
                      ),
                      Expanded(
                        flex: 7,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text(
                              Strings.discount,
                              style: AppTheeme.normalSmallTextRed,
                            ),
                            2.heightBox,
                            const Text(
                              "  ${Strings.price}    ",
                              style: AppTheeme.normalSmallLined,
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ).pOnly(top: 16, bottom: 8).px(16),
            ),
          )
        ],
      ),
    ).pOnly(top: 16);
  }
}
