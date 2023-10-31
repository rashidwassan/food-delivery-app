import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sayfood/models/order.dart';
import 'package:sayfood/styles/app_theme.dart';
import 'package:sayfood/styles/strings.dart';
import 'package:sayfood/styles/styling.dart';
import 'package:sayfood/utils/utilities.dart';
import 'package:sayfood/widgets/main_yellow_appbar.dart';
import 'package:sayfood/widgets/new_products_vendors_appbar.dart';
import 'package:velocity_x/velocity_x.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainYellowAppbar(context: context, notifications: 0),
      body: Column(
        children: [
          buildNotificationsTitleBar(
              height: 45, title: Strings.notification, context: context),
          Expanded(
            child: StreamBuilder(
                stream:
                    FirebaseFirestore.instance.collection('orders').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator(
                      backgroundColor: Styling.mainPurple,
                    );
                  }

                  final foodDocs = snapshot.data!.docs;
                  List<SFOrder> orders = [];
                  String userUID = FirebaseAuth.instance.currentUser!.uid;
                  for (var foodDoc in foodDocs) {
                    final foodData = foodDoc.data();
                    SFOrder order = SFOrder.fromJson(foodData);

                    if (order.userId == userUID) {
                      orders.add(order);
                    }
                  }
                  return ListView.builder(
                    itemCount: orders.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 8, bottom: 8),
                            // height: AppTheeme.capsuleButtonAndContainerHeight - 2,
                            decoration: BoxDecoration(
                              color: Styling.lightGrey,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 7,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Order ID: ${orders[index].id}',
                                        style: AppTheeme.normalButtonText,
                                      ),
                                      5.heightBox,
                                      Text(
                                        'Status: ${orders[index].status.name}',
                                        style:
                                            AppTheeme.notificationsStatusText,
                                      ),
                                    ],
                                  ).px(24).py(12),
                                ),
                                Container(
                                  height: 62,
                                  width: 0.2,
                                  color: Styling.darkGrey,
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${Strings.time}:${Utilities.dateTimeToString(orders[index].orderDate).split('@').last}',
                                        style: AppTheeme.normalSmallText,
                                      ),
                                      5.heightBox,
                                      Text(
                                        '${Strings.date}:${Utilities.dateTimeToString(orders[index].orderDate).split('@').first}',
                                        style: AppTheeme.normalSmallText,
                                      ),
                                    ],
                                  ).px(24).py(12),
                                ),
                              ],
                            ),
                          ),
                          (index == 2 || index == 5)
                              ? buildDateDivider(Strings.date)
                              : const SizedBox.shrink()
                        ],
                      );
                    },
                  ).p(24);
                }),
          ),
        ],
      ),
    );
  }

  Widget buildDateDivider(String date) {
    return SizedBox(
      height: 45,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 0.5,
              color: Colors.black,
            ),
          ),
          40.widthBox,
          Text(
            date,
            style: AppTheeme.homePageSmallText,
          ),
          40.widthBox,
          Expanded(
            child: Container(
              height: 0.5,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
