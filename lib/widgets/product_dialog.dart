import 'package:flutter/material.dart';
import 'package:sayfood/styles/app_theme.dart';
import 'package:sayfood/styles/strings.dart';
import 'package:sayfood/styles/styling.dart';
import 'package:sayfood/widgets/custom_radio_tile.dart';
import 'package:velocity_x/velocity_x.dart';

showProductDialog(context) {
  List<int> adds = [0, 0, 2, 3];

  showDialog(
      context: context,
      builder: (context) => Material(
            color: Colors.transparent,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(15)),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        75.heightBox,
                        ListTile(
                          onTap: () {},
                          title: const Text(
                            Strings.type,
                            style: AppTheeme.normalButtonText,
                          ),
                          subtitle: const Text(
                            ' Box',
                            style: AppTheeme.subtitleSmallText,
                          ),
                        ),
                        const Divider(
                          thickness: 1,
                          height: 2,
                        ),
                        ListTile(
                          onTap: () {},
                          title: const Text(
                            Strings.sizes,
                            style: AppTheeme.normalButtonText,
                          ),
                          subtitle: const Text(
                            '',
                            style: AppTheeme.subtitleSmallText,
                          ),
                        ),
                        const Divider(
                          thickness: 1,
                          height: 2,
                        ),
                        ListTile(
                          onTap: () {},
                          title: const Text(
                            Strings.adds,
                            style: AppTheeme.normalButtonText,
                          ),
                        ),
                        ListView(shrinkWrap: true, children: [
                          customRadioTile(
                            currentValue: adds[0],
                            onTap: () {},
                            title: "",
                            value: 0,
                          ),
                          16.heightBox,
                          customRadioTile(
                            currentValue: adds[1],
                            onTap: () {},
                            title: "",
                            value: 1,
                          ),
                          16.heightBox,
                          customRadioTile(
                            currentValue: adds[2],
                            onTap: () {},
                            title: "",
                            value: 2,
                          ),
                          16.heightBox,
                          customRadioTile(
                            currentValue: adds[3],
                            onTap: () {},
                            title: "",
                            value: 3,
                          ),
                        ]).px(8),
                        16.heightBox,
                        const Divider(
                          thickness: 1,
                          height: 2,
                        ),
                        32.heightBox,
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.grey[200]),
                          child: TextField(
                            maxLines: 4,
                            decoration: InputDecoration(
                              hintText: Strings.addComment,
                              hintStyle: AppTheeme.normalButtonText
                                  .copyWith(color: Colors.black),
                              border: InputBorder.none,
                            ),
                          ).px(12),
                        ),
                        8.heightBox,
                        const Divider(
                          thickness: 1,
                          height: 2,
                        ),
                        32.heightBox,
                        Row(
                          children: [
                            SizedBox(
                              height: 30,
                              child: RawMaterialButton(
                                  padding: const EdgeInsets.all(0),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  fillColor: Styling.darkGrey,
                                  onPressed: () {},
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        padding: const EdgeInsets.all(0),
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.remove,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                      Container(
                                        height: 20,
                                        width: 20,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Center(
                                          child: Text(
                                            '1',
                                            style: AppTheeme.normalSmallText,
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                        padding: const EdgeInsets.all(0),
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.add,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                            24.widthBox,
                            Expanded(
                              child: SizedBox(
                                height: 30,
                                child: RawMaterialButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    fillColor: Styling.darkGrey,
                                    onPressed: () {},
                                    child: const Text(
                                      Strings.addToCart,
                                      style: AppTheeme.normalButtonTextWhite,
                                    )),
                              ),
                            ),
                          ],
                        ),
                        40.heightBox,
                      ],
                    ).px(24),
                  ),
                ).pOnly(top: 32),
                Positioned(
                  left: 8,
                  top: 38,
                  child: IconButton(
                    icon: Icon(
                      Icons.close,
                      color: Colors.grey[600],
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25)),
                  child: const Center(
                    child: Text(Strings.productPhoto,
                        style: TextStyle(fontSize: 13)),
                  ),
                ),
              ],
            ).p(24),
          ));
}
