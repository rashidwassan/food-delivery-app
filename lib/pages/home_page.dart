import 'package:flappy_search_bar_ns/flappy_search_bar_ns.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sayfood/pages/product_page.dart';
import 'package:sayfood/styles/app_theme.dart';
import 'package:sayfood/styles/images.dart';
import 'package:sayfood/styles/strings.dart';
import 'package:sayfood/styles/styling.dart';
import 'package:sayfood/widgets/product_dialog.dart';
import 'package:sayfood/widgets/product_view_tile.dart';
import 'package:sayfood/widgets/search_bar_row.dart';
import 'package:sayfood/widgets/swipper_dots_indicator.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<CategoryIcon> _categoriesListData = [
    CategoryIcon(Strings.newProductsVendors, Images.newDeals),
    CategoryIcon(Strings.bestSellingVendors, Images.bestSellingVendors),
    CategoryIcon(Strings.bestSellingProducts, Images.bestSellingProducts),
    CategoryIcon("", Images.all),
  ];

  late List<Widget> _categotyBodyWidgets;

  @override
  void initState() {
    super.initState();
    _categotyBodyWidgets = [
      _buildNewProductsAndVendorsPage(),
      _buildBestSellingVendorProductList(),
      _buildBestSellingProductsGrid(),
      _buildProductsList(),
    ];
  }

  final SearchBarController _searchBarController = SearchBarController();
  int _currentCategoryIndex = 2;
  int _currentDealsIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildDeliveryLocationHeading(),
          8.heightBox,
          searchBarRow().px(24),
          _buildCategoriesList(),
          32.heightBox,
          _buildDealsSwiper().px(20),
          8.heightBox,
          SwiperDotsIndicator(_currentDealsIndex),
          32.heightBox,
          _categotyBodyWidgets[_currentCategoryIndex],
        ],
      ),
    );
  }

  Widget _buildNewProductsAndVendorsPage() {
    return Column(
      children: [
        _buildNewProductsAndVendorsTitle(
                title: Strings.newProducts, pageName: '/AllNewProductsGridPage')
            .px(20),
        GridView.builder(
          shrinkWrap: true,
          itemCount: 4,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
            crossAxisSpacing: 8,
            mainAxisSpacing: 12,
          ),
          itemBuilder: (context, index) {
            return SizedBox(
                width: 155,
                height: 155,
                child: buildDealsViewWithBottomTitle(title: " ").px(4));
          },
        ).p(20),
        _buildNewProductsAndVendorsTitle(
                title: Strings.newVendors, pageName: '/AllNewVendorsListPage')
            .px(20),
        ListView.builder(
          itemCount: 3,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return SizedBox(
                    height: 155,
                    child: buildDealsViewWithBottomTitle(title: ""))
                .py(16);
          },
        ).px(20),
      ],
    );
  }

  Row _buildNewProductsAndVendorsTitle(
      {required String title, required String pageName}) {
    return Row(
      children: [
        const Expanded(
          flex: 3,
          child: SizedBox(),
        ),
        Expanded(
          flex: 4,
          child: Text(
            title,
            style: AppTheeme.productListTitleFont,
          ).pOnly(left: 16),
        ),
        const Expanded(
          flex: 1,
          child: SizedBox(),
        ),
        Expanded(
          flex: 2,
          child: SizedBox(
            width: 62,
            child: MaterialButton(
              color: Styling.lightGrey,
              splashColor: Styling.mainYellow,
              highlightColor: Styling.mainYellow,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              height: 45,
              onPressed: () {
                Navigator.pushNamed(context, pageName);
              },
              child: const Text(Strings.all),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProductsList() {
    return Column(
      children: [
        buildProductListTitle(title: Strings.bestSellingProducts),
        16.heightBox,
        SizedBox(
          height: 155,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return SizedBox(
                  width: 155,
                  child: buildDealsViewWithBottomTitle(title: " ").px(4));
            },
          ),
        ),
      ],
    );
  }

  Widget _buildBestSellingVendorProductList() {
    return ListView.builder(
      itemCount: 5,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return SizedBox(
                height: 155, child: buildDealsViewWithBottomTitle(title: ""))
            .py(16);
      },
    ).px(20);
  }

  Widget _buildBestSellingProductsGrid() {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: 8,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1,
        crossAxisSpacing: 8,
        mainAxisSpacing: 12,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, ProductPage.id);
          },
          child: SizedBox(
              width: 155,
              height: 155,
              child: buildDealsViewWithBottomTitle(title: " ").px(4)),
        );
      },
    ).p(16);
  }

  Widget buildProductListTitle({required String title}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: AppTheeme.productListTitleFont,
        ),
        16.widthBox,
        SvgPicture.asset(Images.star),
      ],
    ).px(24);
  }

  ClipRRect _buildDealsSwiper() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: SizedBox(
        height: 155,
        // child: Swiper(
        //   curve: Curves.ease,
        //   itemCount: 5,
        //   onTap: (v) {
        //     showProductDialog(context);
        //   },
        //   onIndexChanged: (val) {
        //     setState(() {
        //       _currentDealsIndex = val;
        //     });
        //   },
        //   itemBuilder: (context, index) {
        //     return buildDealsViewWithBottomTitle(title: Strings.deals).px(4);
        //   },
        // ),
        child: buildDealsViewWithBottomTitle(title: Strings.deals).px(4),
      ),
    );
  }

  Widget _buildCategoriesList() {
    return SizedBox(
      height: 46,
      child: Align(
        alignment: Alignment.centerRight,
        child: ListView.builder(
            itemCount: _categoriesListData.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              bool isCurrentSelected = index == _currentCategoryIndex;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _currentCategoryIndex = index;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  width: (isCurrentSelected && _currentCategoryIndex != 3)
                      ? 130
                      : 62,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: (isCurrentSelected)
                        ? Styling.mainYellow
                        : Styling.lightGrey,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        _categoriesListData[index]._iconPath,
                        height: (index == 3) ? 20 : 35,
                      ).px(4),
                      (isCurrentSelected && _currentCategoryIndex != 3)
                          ? Expanded(
                              child: Text(
                                _categoriesListData[index]._title,
                                overflow: TextOverflow.fade,
                                maxLines: 2,
                                style: AppTheeme.homePageSmallText,
                              ).pOnly(right: 4),
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                ),
              ).px(5);
            }),
      ).px24(),
    );
  }

  Container _buildDeliveryLocationHeading() {
    return Container(
      height: 30,
      decoration: const BoxDecoration(
        color: Styling.lightGrey,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(Strings.deliveringTo, style: AppTheeme.homePageSmallText),
          8.widthBox,
          const Text(Strings.currentLocation,
              style: AppTheeme.homePageSmallText),
          8.widthBox,
          SvgPicture.asset(Images.locationIcon)
        ],
      ),
    );
  }
}

class CategoryIcon {
  final String _title;
  final String _iconPath;
  CategoryIcon(this._title, this._iconPath);
}
