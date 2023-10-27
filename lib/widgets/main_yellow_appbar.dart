import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sayfood/styles/images.dart';
import 'package:velocity_x/velocity_x.dart';

AppBar mainYellowAppbar({
  required int notifications,
  required BuildContext context,
}) {
  return AppBar(
    toolbarHeight: 65,
    automaticallyImplyLeading: false,
    centerTitle: true,
    title: Image.asset(
      Images.logosf,
      height: 55,
      color: Colors.white,
    ),
    actions: [
      _buildNotificationIcon(notifications: notifications, context: context)
    ],
  );
}

Widget _buildNotificationIcon(
    {required int notifications, required BuildContext context}) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, '/NotificationScreen');
    },
    child: SizedBox(
      height: 40,
      width: 40,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          SvgPicture.asset(Images.notificationIcon),
          (notifications > 0)
              ? Container(
                  height: 10,
                  decoration: BoxDecoration(
                      color: Colors.red[600], shape: BoxShape.circle),
                )
              : const SizedBox()
        ],
      ),
    ),
  ).pOnly(right: 16);
}
