import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sayfood/pages/main_screen.dart';
import 'package:sayfood/styles/app_theme.dart';
import 'package:sayfood/styles/images.dart';
import 'package:sayfood/styles/strings.dart';
import 'package:sayfood/styles/styling.dart';
import 'package:sayfood/widgets/new_products_vendors_appbar.dart';
import 'package:velocity_x/velocity_x.dart';

class OrderDetails extends StatefulWidget {
  static const String id = '/OrderDetails';

  const OrderDetails({super.key});
  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    return MainPage(
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildNewProductsAndVendorsAppbar(
                  height: 50, title: Strings.orderDetails),
              24.heightBox,
              const Text(
                '#${Strings.orderNumber}',
                style: AppTheeme.normalButtonText,
              ),
              8.heightBox,
              Container(
                decoration: Styling.lightGreyDecoration(radius: 50),
                child: const Text(
                  '${Strings.deliveryTime}: day - time - time',
                  style: AppTheeme.normalButtonText,
                ).p(8),
              ),
              16.heightBox,
              _buildStepperOrderDetailsStepper(stepCount: 5),
              24.heightBox,
              _buildRateOrderButton(),
              16.heightBox,
              _buildDivider(),
              32.heightBox,
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    Strings.orderItems,
                    style: AppTheeme.normalButtonText,
                  ),
                ],
              ).px(24),
              24.heightBox,
              const ListTile(
                leading: CircleAvatar(
                  radius: 35,
                  backgroundColor: Styling.lightGrey,
                ),
                title: Text(
                  Strings.storeName,
                  style: AppTheeme.normalButtonText,
                ),
              ),
              16.heightBox,
              _orderItemsContainer(),
              8.heightBox,
              _buildBillingCard(),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    Strings.deliveryAddress,
                    style: AppTheeme.normalButtonText,
                  ),
                ],
              ).px(24).py(16),
              Container(
                decoration: Styling.lightGreyDecoration(radius: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      Strings.deliveryAddress.toUpperCase(),
                      style: AppTheeme.normalButtonText,
                    ),
                  ],
                ).px(24).py(16),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBillingCard() {
    return Container(
      decoration: Styling.lightGreyDecoration(radius: 0),
      child: Column(
        children: [
          _buildPriceRow(
              title: Strings.totalProductsPrice, price: Strings.aedPrice),
          _divider,
          _buildPriceRow(title: Strings.deliveryFees, price: Strings.price),
          _divider,
          _buildPriceRow(title: Strings.totalPrice, price: Strings.aedPrice),
        ],
      ).p(24),
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
          style: AppTheeme.cartCheckoutBottomCardFont,
        )
      ],
    ).pOnly(top: 16, bottom: 8);
  }

  Widget _orderItemsContainer() {
    return Container(
      decoration: Styling.lightGreyDecoration(radius: 10),
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          _orderTile(),
          _orderTile(),
          _orderTile(),
        ],
      ),
    ).px(16);
  }

  Widget _orderTile() {
    return ListTile(
      dense: true,
      contentPadding: const EdgeInsets.all(0),
      leading: const CircleAvatar(
        radius: 30,
        backgroundColor: Styling.lighterDarkGrey,
      ),
      title: const Text('"${Strings.brandAndProduct}',
          style: AppTheeme.normalSmallText),
      subtitle: Text('-x1',
          style: AppTheeme.normalSmallText.copyWith(color: Colors.black)),
    ).px(8);
  }

  Widget _buildDivider() {
    return const Row(
      children: [
        Expanded(flex: 2, child: SizedBox()),
        Expanded(
          flex: 6,
          child: Divider(
            color: Styling.lighterDarkGrey,
            height: 1,
            thickness: 1,
          ),
        ),
        Expanded(flex: 2, child: SizedBox()),
      ],
    );
  }

  Widget _buildRateOrderButton() {
    return MaterialButton(
      height: 40,
      minWidth: 120,
      color: Styling.darkGrey,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      onPressed: () {},
      child: const Text(
        Strings.rateOrder,
        style: AppTheeme.normalButtonTextWhite,
      ),
    );
  }

  Widget _buildStepperOrderDetailsStepper({required int stepCount}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              Strings.placed,
              style: AppTheeme.normalSmallerButtonTextSemibold,
            ),
            Text(
              Strings.shopping,
              style: AppTheeme.normalSmallerButtonTextSemibold,
            ),
            Text(
              Strings.delivery,
              style: AppTheeme.normalSmallerButtonTextSemibold,
            ),
            Text(
              Strings.delivered,
              style: AppTheeme.normalSmallerButtonTextSemibold,
            ),
          ],
        ),
        8.heightBox,
        Row(
          children: [
            _buildRoundedCheckContainer(
                isSelected: (stepCount > 1) ? true : false),
            _buildHorizontalDivider(),
            _buildRoundedCheckContainer(
                isSelected: (stepCount > 2) ? true : false),
            _buildHorizontalDivider(),
            _buildRoundedCheckContainer(
                isSelected: (stepCount > 3) ? true : false),
            _buildHorizontalDivider(),
            _buildRoundedCheckContainer(
                isSelected: (stepCount > 4) ? true : false),
          ],
        ).px(8)
      ],
    ).px(24);
  }

  Widget _buildHorizontalDivider() {
    return Expanded(
        child: Container(
      height: 2.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.black,
      ),
    ).px(8));
  }

  Widget _buildRoundedCheckContainer({required bool isSelected}) {
    return Container(
      height: 30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: (isSelected) ? Colors.black : Styling.lighterDarkGrey,
      ),
      child: SvgPicture.asset(Images.checkIcon).p(6),
    );
  }
}
