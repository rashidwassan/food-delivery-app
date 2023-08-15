import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sayfood/styles/app_theme.dart';
import 'package:sayfood/styles/images.dart';
import 'package:sayfood/styles/strings.dart';
import 'package:sayfood/styles/styling.dart';
import 'package:sayfood/widgets/search_bar_row.dart';
import 'package:velocity_x/velocity_x.dart';

class CategoriesScreen extends StatefulWidget {
  static const id = '/CategoriesScreen';

  const CategoriesScreen({super.key});
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  int _currentTab = 0;
  late List<Widget> _tabs;

  @override
  void initState() {
    super.initState();
    _tabs = [_buildNewDealsGrid(), _buildHotDealsGrid(), _buildAllDealsGrid()];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        searchBarRow().pOnly(left: 24),
        8.heightBox,
        Expanded(
          child: Row(
            children: [
              _buildCategoriesList(),
              24.widthBox,
              Expanded(
                flex: 7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [_buildTabBar(), 24.heightBox, _tabs[_currentTab]],
                ),
              ),
            ],
          ),
        )
      ],
    ).pOnly(top: 16, left: 0, right: 24);
  }

  Expanded _buildCategoriesList() {
    return Expanded(
      flex: 4,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 9,
        itemBuilder: (context, index) {
          return MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
            padding: const EdgeInsets.all(0),
            onPressed: () {},
            height: context.percentHeight * 7.5,
            color: Styling.lightGrey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${Strings.category}  ${index + 1}',
                  style: AppTheeme.normalButtonText,
                  overflow: TextOverflow.ellipsis,
                ).pOnly(left: 8, right: 8),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildTabBar() {
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          const Spacer(),
          _buildCategoryButton(iconPath: Images.newDeals, value: 0),
          16.widthBox,
          _buildCategoryButton(iconPath: Images.hotDeals, value: 1),
          16.widthBox,
          _buildCategoryButton(iconPath: Images.all, value: 2),
        ],
      ),
    );
  }

  Widget _buildCategoryButton({required String iconPath, required int value}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentTab = value;
        });
      },
      child: AnimatedContainer(
        height: 55,
        width: 60,
        duration: const Duration(milliseconds: 150),
        decoration: BoxDecoration(
            color:
                (_currentTab == value) ? Styling.mainYellow : Styling.lightGrey,
            borderRadius: BorderRadius.circular(15)),
        child: Center(child: SvgPicture.asset(iconPath)),
      ),
    );
  }

  Widget _buildNewDealsGrid() {
    return Expanded(
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: 7,
        gridDelegate: _categoriesScreenGrids,
        itemBuilder: (context, index) {
          return Container(
            decoration: Styling.lightGreyDecoration(radius: 20),
            child: const SizedBox.expand(),
          );
        },
      ),
    );
  }

  Widget _buildHotDealsGrid() {
    return Expanded(
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: 10,
        gridDelegate: _categoriesScreenGrids,
        itemBuilder: (context, index) {
          return Container(
            decoration: Styling.lightGreyDecoration(radius: 20),
            child: const SizedBox.expand(),
          );
        },
      ),
    );
  }

  Widget _buildAllDealsGrid() {
    return Expanded(
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: 11,
        gridDelegate: _categoriesScreenGrids,
        itemBuilder: (context, index) {
          return Container(
            decoration: Styling.lightGreyDecoration(radius: 20),
            child: const SizedBox.expand(),
          );
        },
      ),
    );
  }

  final SliverGridDelegateWithFixedCrossAxisCount _categoriesScreenGrids =
      const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    childAspectRatio: 1,
    crossAxisSpacing: 12,
    mainAxisSpacing: 24,
  );
}
