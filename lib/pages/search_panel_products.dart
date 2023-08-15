import 'package:flappy_search_bar_ns/scaled_tile.dart';
import 'package:flappy_search_bar_ns/search_bar_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sayfood/styles/app_theme.dart';
import 'package:sayfood/styles/images.dart';
import 'package:sayfood/styles/strings.dart';
import 'package:sayfood/styles/styling.dart';
import 'package:sayfood/widgets/search_bar_row.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flappy_search_bar_ns/flappy_search_bar_ns.dart';

class SearchPanelProductsPage extends StatefulWidget {
  static const String id = '/SearchPanelProductsPage';

  const SearchPanelProductsPage({super.key});
  @override
  _SearchPanelProductsPageState createState() =>
      _SearchPanelProductsPageState();
}

class _SearchPanelProductsPageState extends State<SearchPanelProductsPage> {
  bool _isGridView = true;
  int _currentTab = 0;
  late List<Widget> _tabs;

  @override
  void initState() {
    super.initState();
    _tabs = [
      _buildVendorsGrid(),
      _buildProductsGrid(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // _buildSearchRow(),
          _buildTabBar(),
          24.heightBox,
          _tabs[_currentTab]
        ],
      ),
    ).p(24);
  }

  // Row _buildSearchRow() {
  //   return Row(
  //     children: [
  //       Flexible(
  //         child: SizedBox(
  //           height: 80,
  //           child: SearchBar<Post>(
  //             textStyle: AppTheeme.homePageSmallText,
  //             searchBarStyle: SearchBarStyle(
  //                 padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
  //                 backgroundColor: Styling.lightGrey,
  //                 borderRadius: BorderRadius.circular(30)),
  //             hintText: Strings.homepageSearchHint,
  //             hintStyle:
  //                 AppTheeme.homePageSmallText.copyWith(color: Colors.grey),
  //             listPadding: const EdgeInsets.symmetric(horizontal: 10),
  //             onSearch: (item) {},
  //             //  searchBarController: _searchBarController,
  //             searchBarPadding: const EdgeInsets.all(0),
  //             indexedScaledTileBuilder: (int index) =>
  //                 ScaledTile.count(1, index.isEven ? 2 : 1),
  //             icon: SvgPicture.asset(Images.searchIcon),
  //             onCancelled: () {
  //               print("Cancelled triggered");
  //             },
  //             mainAxisSpacing: 10,
  //             crossAxisSpacing: 10,
  //             crossAxisCount: 2,
  //             onItemFound: (Post post, int index) {
  //               return Container(
  //                 color: Colors.lightBlue,
  //                 child: ListTile(
  //                   title: Text(post.title),
  //                   subtitle: Text(post.body),
  //                   onTap: () {},
  //                 ),
  //               );
  //             },
  //           ),
  //         ),
  //       ),
  //       GestureDetector(
  //         onTap: () {
  //           setState(() {
  //             _isGridView = true;
  //             _tabs = [
  //               _buildVendorsGrid(),
  //               _buildProductsGrid(),
  //             ];
  //           });
  //         },
  //         child: SvgPicture.asset(
  //           (_isGridView == true)
  //               ? Images.gridVeiwFilled
  //               : Images.gridVeiwOutlined,
  //           height: 30,
  //         ),
  //       ).p(5).px(8),
  //       GestureDetector(
  //         onTap: () {
  //           setState(() {
  //             _isGridView = false;
  //             _tabs = [
  //               _buildVendorsListView(),
  //               _buildProductsListView(),
  //             ];
  //           });
  //         },
  //         child: SvgPicture.asset(
  //           (_isGridView == false)
  //               ? Images.listVeiwFilled
  //               : Images.listVeiwOutlined,
  //           height: 30,
  //         ),
  //       ).p(5).pOnly(left: 8),
  //     ],
  //   );
  // }

  SizedBox _buildTabBar() {
    return SizedBox(
      height: 45,
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _currentTab = 0;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                decoration: BoxDecoration(
                    color: (_currentTab == 0)
                        ? Styling.mainYellow
                        : Styling.lightGrey,
                    borderRadius: BorderRadius.circular(15)),
                child: const Center(
                  child: Text(
                    Strings.vendors,
                    style: AppTheeme.normalButtonText,
                  ),
                ),
              ),
            ),
          ),
          16.widthBox,
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _currentTab = 1;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                decoration: BoxDecoration(
                    color: (_currentTab == 1)
                        ? Styling.mainYellow
                        : Styling.lightGrey,
                    borderRadius: BorderRadius.circular(15)),
                child: const Center(
                  child: Text(
                    Strings.products,
                    style: AppTheeme.normalButtonText,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildVendorsGrid() {
    return Expanded(
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: 12,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          crossAxisSpacing: 12,
          mainAxisSpacing: 24,
        ),
        itemBuilder: (context, index) {
          return Container(
            width: 155,
            height: 155,
            decoration: BoxDecoration(
              color: Styling.lightGrey,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const SizedBox.expand(),
          );
        },
      ),
    );
  }

  Widget _buildVendorsListView() {
    return Expanded(
      child: ListView.builder(
          itemCount: 10,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Container(
              height: context.percentWidth * 30,
              decoration: Styling.lightGreyDecoration(radius: 25),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: context.percentWidth * 27,
                    width: context.percentWidth * 27,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                  ).p(12),
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ListTile(
                            title: const Text(
                              Strings.productName,
                              style: AppTheeme.normalButtonText,
                            ),
                            subtitle: const Text(
                              Strings.description,
                              style: AppTheeme.normalSmallText,
                            ),
                            trailing: SizedBox(
                              height: 20,
                              width: 50,
                              child: Row(
                                children: [
                                  Container(
                                    child: SvgPicture.asset(
                                        Images.vendorListDeliveryRatingIcon),
                                  ),
                                  3.widthBox,
                                  const Text('4.90',
                                      style: AppTheeme.normalSmallText),
                                ],
                              ),
                            ),
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              Container(
                                child: SvgPicture.asset(
                                    Images.vendorListDeliveryLocationIcon),
                              ),
                              3.widthBox,
                              const Text('1.0 km',
                                  style: AppTheeme.normalSmallText),
                              const Spacer(),
                              Container(
                                child: SvgPicture.asset(
                                    Images.vendorListDeliveryChargesIcon),
                              ),
                              3.widthBox,
                              const Text('15.0 AED',
                                  style: AppTheeme.normalSmallText),
                              const Spacer(),
                              Container(
                                child: SvgPicture.asset(
                                    Images.vendorListDeliveryTimeIcon),
                              ),
                              3.widthBox,
                              const Text('40m',
                                  style: AppTheeme.normalSmallText),
                            ],
                          ).p(16)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ).py(12);
          }),
    );
  }

  Widget _buildProductsGrid() {
    return Expanded(
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: 12,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.5,
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 24,
        ),
        itemBuilder: (context, index) {
          return SizedBox(
            height: context.percentWidth * 70,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Styling.lightGrey,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: SizedBox(
                    width: (context.screenWidth - 72) / 2,
                    height: (context.screenWidth - 72) / 2,
                  ),
                ),
                ListTile(
                  title: const Text(
                    Strings.productName,
                    style: AppTheeme.normalButtonText,
                  ),
                  subtitle: const Text(
                    Strings.description,
                    style: AppTheeme.normalSmallText,
                  ),
                  trailing: SizedBox(
                    width: 30,
                    height: 22,
                    child: RawMaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      fillColor: Styling.darkGrey,
                      padding: const EdgeInsets.all(0),
                      onPressed: () {},
                      child: SvgPicture.asset(Images.cartIconWhite),
                    ),
                  ),
                ),
                8.heightBox,
                ListTile(
                  title: const Text(
                    Strings.aedPrice,
                    style: AppTheeme.normalButtonText,
                  ),
                  subtitle: Row(
                    children: [
                      Text(
                        Strings.aedPrice,
                        style: AppTheeme.normalSmallText
                            .copyWith(decoration: TextDecoration.lineThrough),
                      ),
                      8.widthBox,
                      Text(
                        '40% off',
                        style: AppTheeme.normalSmallText
                            .copyWith(color: Colors.red),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildProductsListView() {
    return Expanded(
      child: ListView.builder(
        itemCount: 6,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Styling.lightGrey,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: SizedBox(
                    width: (context.screenWidth - 96) / 2,
                    height: (context.screenWidth - 96) / 2,
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      children: [
                        const ListTile(
                          title: Text(
                            Strings.productName,
                            style: AppTheeme.normalButtonText,
                          ),
                          subtitle: Text(
                            Strings.description,
                            style: AppTheeme.normalSmallText,
                          ),
                        ),
                        8.heightBox,
                        ListTile(
                          title: const Text(
                            Strings.aedPrice,
                            style: AppTheeme.normalSmallText,
                          ),
                          subtitle: Row(
                            children: [
                              Text(
                                Strings.aedPrice,
                                style: AppTheeme.normalSmallText.copyWith(
                                    decoration: TextDecoration.lineThrough),
                              ),
                              8.widthBox,
                              Text(
                                '40% off',
                                style: AppTheeme.normalSmallText
                                    .copyWith(color: Colors.red),
                              ),
                            ],
                          ),
                          trailing: SizedBox(
                            width: 30,
                            height: 22,
                            child: RawMaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4)),
                              fillColor: Styling.darkGrey,
                              padding: const EdgeInsets.all(0),
                              onPressed: () {},
                              child: SvgPicture.asset(Images.cartIconWhite),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
