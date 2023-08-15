import 'package:flutter/material.dart';
import 'package:sayfood/styles/app_theme.dart';
import 'package:sayfood/styles/images.dart';
import 'package:sayfood/styles/strings.dart';
import 'package:sayfood/styles/styling.dart';
import 'package:sayfood/widgets/main_yellow_appbar.dart';
import 'package:sayfood/widgets/new_products_vendors_appbar.dart';
import 'package:velocity_x/velocity_x.dart';

class EditDevliveryAddresses extends StatelessWidget {
  static const id = '/EditAddressesScreen';

  const EditDevliveryAddresses({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainYellowAppbar(notifications: 1, context: context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildNewProductsAndVendorsAppbar(
                height: 45, title: Strings.deliveryAddresses),
            16.heightBox,
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                Images.mapsPlaceholder,
                fit: BoxFit.cover,
                height: context.percentHeight * 35,
                width: context.percentWidth * 90,
              ),
            ),
            24.heightBox,
            const Text(
              Strings.editLocationOnMap,
              style: AppTheeme.normalButtonText,
            ),
            Container(
              decoration: Styling.lightGreyDecoration(radius: 25),
              child: Column(
                children: [
                  _buildDeliveryAddressEditRow(
                      leadingText: Strings.home, middleText: '', onTap: () {}),
                  const Divider(
                    height: 8,
                    thickness: 1,
                  ).px(16),
                  ListTile(
                    onTap: () {},
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          Strings.addressType,
                          style: AppTheeme.normalButtonText,
                        ),
                        8.heightBox,
                        const Text(
                          'Flat number / Building name / street address',
                          style: AppTheeme.normalButtonText,
                        ),
                      ],
                    ).pOnly(left: 16),
                  ),
                  const Divider(
                    height: 8,
                    thickness: 1,
                  ).px(16),
                  _buildDeliveryAddressEditRow(
                      leadingText: Strings.nearestLandmark,
                      middleText: '',
                      trailingText: Strings.optional),
                ],
              ).p(8),
            ).p(24),
            Container(
              decoration: Styling.lightGreyDecoration(radius: 25),
              child: TextField(
                maxLines: 4,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: Strings.instructionsForDeliveryMan,
                    hintStyle: AppTheeme.normalButtonText
                        .copyWith(color: Colors.grey)),
              ).px(12),
            ).px(24),
            8.heightBox,
            MaterialButton(
              height: 45,
              color: Styling.darkGrey,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    Strings.save,
                    style: AppTheeme.largeText.copyWith(color: Colors.white),
                  ).p(5),
                ],
              ),
            ).px(24),
            24.heightBox,
          ],
        ),
      ),
    );
  }

  Widget _buildDeliveryAddressEditRow(
      {required String leadingText,
      required String middleText,
      String? trailingText,
      Function()? onTap}) {
    return ListTile(
      onTap: onTap,
      title: Row(
        children: [
          Expanded(
            flex: 5,
            child: Text(
              leadingText,
              style: AppTheeme.normalButtonText,
            ),
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
              style: AppTheeme.normalButtonText.copyWith(color: Colors.grey),
            ),
          ),
        ],
      ).pOnly(left: 16),
    );
  }
}
