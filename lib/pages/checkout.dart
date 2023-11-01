import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sayfood/models/order.dart';
import 'package:sayfood/provider/cart_items_provider.dart';
import 'package:sayfood/styles/app_theme.dart';
import 'package:sayfood/styles/images.dart';
import 'package:sayfood/styles/strings.dart';
import 'package:sayfood/styles/styling.dart';
import 'package:sayfood/utils/firebase_services.dart';
import 'package:sayfood/widgets/dialogs.dart';
import 'package:velocity_x/velocity_x.dart';

class CheckoutScreen extends StatelessWidget {
  static const String id = '/CheckoutScreen';

  final BoxDecoration _paymentButtonsDecoration = BoxDecoration(
      color: Styling.lightGrey,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(width: 0.2, color: Colors.black54));

  CheckoutScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: const ScrollBehavior(),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(color: Styling.lightGrey, height: 45),
            Column(
              children: [
                _buildDeliveryAddressTile(buildContext: context),
                12.heightBox,
                _buildDeliveryTimeTile(buildContext: context),
                16.heightBox,
                _buildPaymentMethodTile(buildContext: context),
                24.heightBox,
                _buildNotesAndInstructions(buildContext: context),
                12.heightBox,
                _buildPromoCodeTile(buildContext: context),
                24.heightBox,
                _buildBillingCard(),
                16.heightBox,
                _buildPlaceOrderButton(buildContext: context),
                24.heightBox
              ],
            ).p(24)
          ],
        ),
      ),
    );
  }

  Widget _buildPlaceOrderButton({required BuildContext buildContext}) {
    return Consumer<CartItemsProvider>(
      builder: (ctx, cart, child) => MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Styling.darkGrey,
        height: 60,
        onPressed: () {
          FirebaseServices.placeOrder(
                  order: SFOrder(
                      id: DateTime.now().toString(),
                      userId: FirebaseAuth.instance.currentUser!.uid,
                      foodIds: [
                        for (int i = 0; i < cart.cartItems.length; i++)
                          cart.cartItems[i].id
                      ],
                      totalAmount: cart.discountPrice,
                      orderDate: DateTime.now(),
                      status: Status.pending))
              .then((value) =>
                  showInfoDialog(buildContext, 'Order Placed Successfully'))
              .then((value) => cart.clearCart())
              .then((value) => Navigator.pushNamed(buildContext, '/MainPage'));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              Strings.placeOrder,
              style:
                  AppTheeme.productListTitleFont.copyWith(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildBillingCard() {
    return Consumer<CartItemsProvider>(
      builder: (child, cart, c) => Container(
        decoration: Styling.lightGreyDecoration(radius: 25),
        child: Column(
          children: [
            _buildPriceRow(
                title: Strings.totalProductsPrice,
                price: '${cart.totalPrice} PKR'),
            _divider,
            _buildDiscountRow(
                title: Strings.discount,
                price: '${cart.totalPrice - cart.discountPrice} PKR'),
            _divider,
            _buildPriceRow(title: Strings.serviceFees, price: '25 PKR'),
            _divider,
            _buildPriceRow(
                title: Strings.totalPrice,
                price: (cart.discountPrice + 25).toString() + 'PKR'),
            _divider
          ],
        ).p(24),
      ),
    );
  }

  final Widget _divider = const Divider(
    height: 8,
    thickness: 1,
  );

  Widget _buildPriceRow({required String title, required String price}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTheeme.cartCheckoutBottomCardFont,
        ),
        Text(
          price,
          style: AppTheeme.cartCheckoutBottomCardFont
              .copyWith(fontWeight: FontWeight.bold),
        )
      ],
    ).pOnly(top: 16, bottom: 8);
  }

  Widget _buildDiscountRow({required String title, required String price}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style:
              AppTheeme.cartCheckoutBottomCardFont.copyWith(color: Colors.red),
        ),
        Text(
          price,
          style: AppTheeme.cartCheckoutBottomCardFont.copyWith(
              color: Colors.red,
              decoration: TextDecoration.lineThrough,
              fontWeight: FontWeight.bold),
        )
      ],
    ).pOnly(top: 16, bottom: 8);
  }

  GestureDetector _buildPromoCodeTile({required BuildContext buildContext}) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: Styling.lightGreyDecoration(radius: 25),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(Images.promoCode).pOnly(top: 8),
            8.widthBox,
            const Text(
              Strings.usePromoCode,
              style: AppTheeme.normalMediumSmallText,
            ),
            8.widthBox,
            Flexible(
              child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                  child: const TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(0),
                      border: InputBorder.none,
                    ),
                  ).px(8)),
            )
          ],
        ).p(16).px(8),
      ),
    );
  }

  GestureDetector _buildPaymentMethodTile(
      {required BuildContext buildContext}) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: Styling.lightGreyDecoration(radius: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(Images.paymentMethod),
                24.widthBox,
                const Text(
                  Strings.paymentMethod,
                  style: AppTheeme.normalMediumSmallText,
                ),
              ],
            ).p(16).px(8),
            8.heightBox,
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 70,
                    decoration: _paymentButtonsDecoration,
                    child: const Center(
                      child: Text(
                        Strings.cash,
                        style: AppTheeme.normalButtonText,
                      ),
                    ),
                  ),
                ),
                12.widthBox,
                Expanded(
                  child: Container(
                    height: 70,
                    decoration: _paymentButtonsDecoration,
                    child: Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(Images.visa),
                        12.widthBox,
                        SvgPicture.asset(Images.masterCard),
                      ],
                    )),
                  ),
                ),
              ],
            ).px(8),
            8.heightBox
          ],
        ),
      ),
    );
  }

  GestureDetector _buildDeliveryTimeTile({required BuildContext buildContext}) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: Styling.lightGreyDecoration(radius: 25),
        child: Row(
          children: [
            SvgPicture.asset(Images.deliveryTime),
            24.widthBox,
            const Text(
              '${Strings.orderTime}:  ~30 min',
              style: AppTheeme.normalMediumSmallText,
            ),
          ],
        ).p(24),
      ),
    );
  }

  GestureDetector _buildDeliveryAddressTile(
      {required BuildContext buildContext}) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: Styling.lightGreyDecoration(radius: 25),
        child: Row(
          children: [
            SvgPicture.asset(Images.deliveryAddress),
            24.widthBox,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Current Branch',
                  style: AppTheeme.normalMediumSmallText,
                ),
                4.heightBox,
                const Text(
                  'Branch #2, Latifabad, Hyderabad',
                  style: AppTheeme.normalSmallerButtonText,
                ),
              ],
            )
          ],
        ).p(24).pOnly(bottom: 8),
      ),
    );
  }

  GestureDetector _buildNotesAndInstructions(
      {required BuildContext buildContext}) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: Styling.lightGreyDecoration(radius: 25),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(Images.notesInstructions),
            16.widthBox,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  Strings.notesAndInstructions,
                  style: AppTheeme.normalMediumSmallText,
                ),
                4.heightBox,
                Text(
                  Strings.notesAndInstructionsEx,
                  style: AppTheeme.normalSmallerButtonText
                      .copyWith(color: Colors.grey),
                ),
              ],
            ).pOnly(top: 8, bottom: 8)
          ],
        ).p(16).px(8),
      ),
    );
  }
}
