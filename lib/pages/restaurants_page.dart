import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sayfood/pages/main_screen.dart';
import 'package:sayfood/styles/app_theme.dart';
import 'package:sayfood/styles/images.dart';
import 'package:sayfood/styles/strings.dart';
import 'package:sayfood/styles/styling.dart';
import 'package:sayfood/widgets/custom_rating_bar.dart';
import 'package:sayfood/widgets/search_bar_row.dart';
import 'package:velocity_x/velocity_x.dart';

class RestaurantsPage extends StatefulWidget {
  static const String id = '/RestaurantsPage';

  const RestaurantsPage({super.key});
  @override
  _RestaurantsPageState createState() => _RestaurantsPageState();
}

class _RestaurantsPageState extends State<RestaurantsPage> {
  int _currentTab = 0;
  late List<Widget> _tabs;

  @override
  void initState() {
    super.initState();
    _tabs = [
      _buildRestaurantPageItemListView(),
      _buildRestaurantPageItemListView(),
      _buildRestaurantPageItemListView(),
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
            searchBarRow(includeFilterIcon: false).px(24),
            _buildTabBar().px(24),
            24.heightBox,
            _tabs[_currentTab]
          ],
        ),
      ),
    );
  }

  Widget _buildRestaurantPageItemListView() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 7,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return _buildRestaurantDealsViewWithBottomTitle(
                  title: 'Chicken burger')
              .px(24)
              .pOnly(bottom: 24);
        });
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
                          ? Styling.mainPurple
                          : Styling.lightGrey,
                      borderRadius: BorderRadius.circular(25)),
                  child: Center(
                    child: const Text(
                      Strings.indian,
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
                          ? Styling.mainPurple
                          : Styling.lightGrey,
                      borderRadius: BorderRadius.circular(25)),
                  child: Center(
                    child: const Text(
                      Strings.japanese,
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
                          ? Styling.mainPurple
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

  Widget _buildRestaurantDealsViewWithBottomTitle({required String title}) {
    return Container(
      height: 140,
      decoration: const BoxDecoration(
        color: Styling.lightGrey,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 110,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: const Center(
              child: Text('LOGO'),
            ),
          ).p(12).py(8),
          6.widthBox,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                Strings.restaurantName,
                style: AppTheeme.normalMediumSmallText,
              ),
              const Spacer(),
              const Text(
                Strings.deserts,
                style: AppTheeme.normalSmallerButtonText,
              ),
              const Spacer(),
              Text(
                Strings.open,
                style: AppTheeme.normalSmallText.copyWith(color: Colors.green),
              ),
              12.heightBox
            ],
          ).py(24),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomRatingBar(rating: 4),
              const Spacer(),
              Row(
                children: [
                  SvgPicture.asset(Images.locationIcon, height: 16),
                  4.widthBox,
                  const Text(
                    '1.0',
                    style: AppTheeme.normalSmallerButtonText,
                  ),
                ],
              ),
              const Spacer(),
              Text(
                Strings.time.toUpperCase(),
                style: AppTheeme.normalSmallerButtonText,
              ),
              12.heightBox
            ],
          ).py(24),
          24.widthBox
        ],
      ),
    );
  }
}
