import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sayfood/pages/edit_delivery_address.dart';
import 'package:sayfood/pages/main_screen.dart';
import 'package:sayfood/styles/app_theme.dart';
import 'package:sayfood/styles/images.dart';
import 'package:sayfood/styles/strings.dart';
import 'package:sayfood/styles/styling.dart';
import 'package:sayfood/widgets/new_products_vendors_appbar.dart';
import 'package:velocity_x/velocity_x.dart';

class DeliveryAddressesScreen extends StatefulWidget {
  static const String id = '/DeliveryAddressesScreen';

  const DeliveryAddressesScreen({super.key});

  @override
  _DeliveryAddressesScreenState createState() =>
      _DeliveryAddressesScreenState();
}

class _DeliveryAddressesScreenState extends State<DeliveryAddressesScreen> {
  @override
  Widget build(BuildContext context) {
    return MainPage(
      child: Column(
        children: [
          buildNewProductsAndVendorsAppbar(
              height: 50, title: Strings.currentAddress),
          Container(
            decoration: Styling.lightGreyDecoration(radius: 20),
            child: Column(
              children: [
                _normalAddressTile(
                    titleText: Strings.home,
                    subtitle: Strings.addressDetails,
                    onTap: () {}),
                _divider(),
                _addAddressTile(
                    titleText: Strings.work, subtitle: Strings.addWorkAddress),
                _divider(),
                _normalAddressTile(
                    titleText: Strings.anotherAddress,
                    subtitle: Strings.addWorkAddress),
              ],
            ).py(8),
          ).p(24)
        ],
      ),
    );
  }

  Widget _divider() {
    return const Divider(
      height: 1,
      thickness: 1,
    ).px(12);
  }

  Widget _normalAddressTile(
      {required String titleText,
      required String subtitle,
      Function()? onTap}) {
    return ListTile(
      onTap: () {
        showCupertinoModalPopup(
          context: context,
          builder: (BuildContext context) => CupertinoActionSheet(
              title: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        titleText,
                        style: AppTheeme.normalButtonText
                            .copyWith(color: Colors.black),
                      ),
                    ],
                  ),
                  8.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        subtitle,
                        style: AppTheeme.normalSmallText,
                      ),
                    ],
                  ),
                ],
              ),
              actions: <Widget>[
                _customCupertinoActionSheetAction(
                    title: Strings.edit,
                    titleColor: Colors.green,
                    iconPath: Images.editIcon,
                    onTap: () {
                      Navigator.pushNamed(context, EditDevliveryAddresses.id);
                    }),
                _customCupertinoActionSheetAction(
                    title: Strings.delete,
                    titleColor: Colors.red,
                    iconPath: Images.deleteIcon,
                    onTap: () {}),
              ],
              cancelButton: CupertinoActionSheetAction(
                isDefaultAction: true,
                onPressed: () {
                  Navigator.pop(context, 'Cancel');
                },
                child: const Text('Cancel'),
              )),
        );
      },
      leading: SvgPicture.asset(Images.deliveryAddress),
      title: Text(titleText),
      subtitle: Text(
        subtitle,
        style: AppTheeme.normalSmallText,
      ).pOnly(top: 4),
      trailing: IconButton(
          icon: const Icon(
            Icons.more_horiz_rounded,
            size: 35,
          ),
          onPressed: onTap),
    );
  }

  CupertinoActionSheetAction _customCupertinoActionSheetAction(
      {required String title,
      required Color titleColor,
      required String iconPath,
      required Function() onTap}) {
    return CupertinoActionSheetAction(
      onPressed: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(iconPath),
          12.widthBox,
          Text(
            title,
            style: AppTheeme.normalButtonText.copyWith(color: titleColor),
          )
        ],
      ).px(12).py(8),
    );
  }

  Widget _addAddressTile(
      {required String titleText,
      required String subtitle,
      Function()? onTap}) {
    return ListTile(
      onTap: onTap,
      leading: SvgPicture.asset(Images.deliveryAddress),
      title: Text(titleText),
      subtitle: Text(
        subtitle,
        style: AppTheeme.normalSmallText.copyWith(color: Colors.green),
      ).pOnly(top: 4),
      trailing: IconButton(
          icon: const Icon(
            Icons.add,
            color: Colors.black,
            size: 25,
          ),
          onPressed: onTap),
    );
  }
}
