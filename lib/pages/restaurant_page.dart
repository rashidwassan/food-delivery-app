import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sayfood/pages/main_screen.dart';
import 'package:sayfood/styles/app_theme.dart';
import 'package:sayfood/styles/images.dart';
import 'package:sayfood/styles/strings.dart';
import 'package:sayfood/styles/styling.dart';
import 'package:sayfood/widgets/search_bar_row.dart';
import 'package:velocity_x/velocity_x.dart';

class RestaurantPage extends StatefulWidget {
  static const String id = '/RestaurantPage';

  const RestaurantPage({super.key});
  @override
  _RestaurantPageState createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
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
                          ? Styling.mainYellow
                          : Styling.lightGrey,
                      borderRadius: BorderRadius.circular(25)),
                  child: Center(
                    child: const Text(
                      Strings.soup,
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
                      Strings.appetizers,
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

  Widget _buildRestaurantDealsViewWithBottomTitle(
      {required String title, String? imagePath}) {
    return AspectRatio(
      aspectRatio: 20 / 9,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Styling.lightGrey,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
              image: (imagePath == null)
                  ? null
                  : DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(imagePath),
                    ),
            ),
            child: Container(),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Styling.lighterDarkGrey,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            height: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: AppTheeme.normalSmallerButtonText,
                ),
                const Spacer(),
                const Text(
                  Strings.aedPrice,
                  style: AppTheeme.normalSmallerButtonText,
                ),
              ],
            ).px(16),
          )
        ],
      ),
    );
  }
}
