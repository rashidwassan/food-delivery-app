import 'package:flutter/material.dart';
import 'package:sayfood/pages/main_screen.dart';
import 'package:sayfood/pages/order_details.dart';
import 'package:sayfood/styles/app_theme.dart';
import 'package:sayfood/styles/strings.dart';
import 'package:sayfood/styles/styling.dart';
import 'package:sayfood/widgets/new_products_vendors_appbar.dart';
import 'package:velocity_x/velocity_x.dart';

class MyOrdersScreen extends StatelessWidget {
  static const String id = '/MyOrdersScreen';

  const MyOrdersScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return MainPage(
      child: Column(
        children: [
          buildNewProductsAndVendorsAppbar(
              height: 45, title: Strings.myOrders, buildBackIcon: false),
          const SizedBox(
            height: 12,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return _customMyOrdersCard(context);
                }),
          ),
        ],
      ),
    );
  }

  Widget _customMyOrdersCard(context) {
    return Container(
      decoration: Styling.lightGreyDecoration(radius: 25),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, OrderDetails.id);
        },
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '#${Strings.orderNumber}',
                  style: AppTheeme.normalButtonText,
                ),
                const Text(
                  '${Strings.placedAt} - day - time pm',
                  style: AppTheeme.normalButtonText,
                ),
                16.widthBox
              ],
            ),
            8.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      Strings.place,
                      style: AppTheeme.normalButtonText,
                    ),
                    5.heightBox,
                    const Text(
                      Strings.delivered,
                      style: TextStyle(color: Colors.green),
                    )
                  ],
                ),
                IconButton(
                    icon: const Icon(
                      Icons.arrow_forward,
                      color: Colors.grey,
                    ),
                    onPressed: () {})
              ],
            )
          ],
        ).py(16).px(24),
      ),
    ).px((16)).py(6);
  }
}
