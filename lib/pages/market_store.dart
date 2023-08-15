import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sayfood/pages/main_screen.dart';
import 'package:sayfood/styles/app_theme.dart';
import 'package:sayfood/styles/images.dart';
import 'package:sayfood/styles/strings.dart';
import 'package:sayfood/styles/styling.dart';
import 'package:sayfood/widgets/search_bar_row.dart';
import 'package:velocity_x/velocity_x.dart';

class MarketStorePage extends StatefulWidget {
  static const String id = '/MarketOrStorePage';

  const MarketStorePage({super.key});
  @override
  _MarketStorePageState createState() => _MarketStorePageState();
}

class _MarketStorePageState extends State<MarketStorePage> {
  int _currentTab = 0;
  late List<Widget> _tabs;

  @override
  void initState() {
    super.initState();
    _tabs = [
      _buildStoreItemsGrid(),
      _buildStoreItemsGrid(),
      _buildStoreItemsGrid(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MainPage(
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildDeliveryLocationHeading(),
            8.heightBox,
            searchBarRow().px(24),
            _buildTabBar().px(24),
            24.heightBox,
            _tabs[_currentTab]
          ],
        ),
      ),
    );
  }

  SizedBox _buildTabBar() {
    return SizedBox(
      height: 45,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: [
              GestureDetector(
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
                      borderRadius: BorderRadius.circular(25)),
                  child: Center(
                    child: const Text(
                      Strings.vegitables,
                      style: AppTheeme.normalSmallerButtonText,
                    ).px(24),
                  ),
                ),
              ),
              16.widthBox,
              GestureDetector(
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
                      borderRadius: BorderRadius.circular(25)),
                  child: Center(
                    child: const Text(
                      Strings.meat,
                      style: AppTheeme.normalSmallerButtonText,
                    ).px(24),
                  ),
                ),
              ),
              16.widthBox,
              GestureDetector(
                onTap: () {
                  setState(() {
                    _currentTab = 2;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  decoration: BoxDecoration(
                      color: (_currentTab == 2)
                          ? Styling.mainYellow
                          : Styling.lightGrey,
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: const Text(
                      Strings.all,
                      style: AppTheeme.normalSmallerButtonText,
                    ).px(24),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStoreItemsGrid() {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: 11,
      gridDelegate: _categoriesScreenGrids,
      itemBuilder: (context, index) {
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    decoration: Styling.lightGreyDecoration(radius: 20),
                    child: SizedBox(
                      width: context.percentWidth * 42,
                      height: 110,
                    ),
                  ).p(8),
                  SvgPicture.asset(Images.roundedAFavIconOutlined),
                ],
              ).py(12),
              const Text(
                Strings.aedPrice,
                textAlign: TextAlign.start,
                style: AppTheeme.normalSmallText,
              ),
              const Text(
                Strings.brandAndProduct + "+  " + '500',
                textAlign: TextAlign.start,
                style: AppTheeme.normalSmallText,
              ),
              _buildAddToCartButton(context)
            ],
          ),
        );
      },
    ).px(24);
  }

  Widget _buildAddToCartButton(context) {
    return MaterialButton(
      height: 25,
      color: Styling.darkGrey,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(Images.cartIconWhite),
          3.widthBox,
          Text(
            Strings.addToCart,
            style: AppTheeme.normalSmallText.copyWith(color: Colors.white),
          ).p(5),
        ],
      ),
    );
  }

  final SliverGridDelegateWithFixedCrossAxisCount _categoriesScreenGrids =
      const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    childAspectRatio: 0.75,
    crossAxisSpacing: 24,
    mainAxisSpacing: 24,
  );

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
