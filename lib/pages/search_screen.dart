import 'package:flutter/material.dart';
import 'package:sayfood/styles/app_theme.dart';
import 'package:sayfood/styles/strings.dart';
import 'package:sayfood/styles/styling.dart';
import 'package:sayfood/widgets/search_bar_row.dart';
import 'package:velocity_x/velocity_x.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int _currentTab = 0;
  late List<Widget> _tabs;

  @override
  void initState() {
    super.initState();
    _tabs = [
      _buildMyFeedGrid(),
      _buildDiscoverGrid(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          searchBarRow(includeFilterIcon: false),
          12.heightBox,
          _buildTabBar(),
          24.heightBox,
          _tabs[_currentTab]
        ],
      ),
    ).pOnly(top: 16, left: 24, right: 24);
  }

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
                        ? Styling.mainPurple
                        : Styling.lightGrey,
                    borderRadius: BorderRadius.circular(15)),
                child: const Center(
                  child: Text(
                    Strings.myFeed,
                    style: AppTheeme.normalMediumSmallText,
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
                        ? Styling.mainPurple
                        : Styling.lightGrey,
                    borderRadius: BorderRadius.circular(15)),
                child: const Center(
                  child: Text(
                    Strings.discover,
                    style: AppTheeme.normalMediumSmallText,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildMyFeedGrid() {
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

  Widget _buildDiscoverGrid() {
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
}
