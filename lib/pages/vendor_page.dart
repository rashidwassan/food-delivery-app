import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sayfood/styles/app_theme.dart';
import 'package:sayfood/styles/images.dart';
import 'package:sayfood/styles/strings.dart';
import 'package:sayfood/styles/styling.dart';
import 'package:sayfood/widgets/custom_rating_bar.dart';
import 'package:sayfood/widgets/search_bar_row.dart';
import 'package:velocity_x/velocity_x.dart';

class VendorsPage extends StatefulWidget {
  static const String id = '/VendorsPage';

  const VendorsPage({super.key});
  @override
  _VendorsPageState createState() => _VendorsPageState();
}

class _VendorsPageState extends State<VendorsPage> {
  int _currentTab = 0;
  late List<Widget> _tabs;

  @override
  void initState() {
    super.initState();
    _tabs = [
      _buildVendorItemsGrid(),
      _buildVendorItemsGrid(),
      _buildVendorItemsGrid(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildTabBar(),
          32.heightBox,
          _buildItemContainer(),
          24.heightBox,
          _buildVendorTile(),
          8.heightBox,
          searchBarRow(),
          24.heightBox,
          _tabs[_currentTab]
        ],
      ),
    ).p(24);
  }

  Widget _buildVendorTile() {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: Container(
        height: 160,
        width: 60,
        decoration: Styling.lightGreyDecoration(radius: 15),
      ),
      title: const Text(
        Strings.vendorName,
        style: AppTheeme.normalSmallText,
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          3.heightBox,
          Row(
            children: [
              SvgPicture.asset(
                Images.locationIcon,
                height: 10,
              ),
              5.widthBox,
              const Text(
                Strings.vendorLocation,
                style: TextStyle(fontSize: 8, color: Colors.black),
              ),
            ],
          ),
          5.heightBox,
          const Text(
            Strings.description,
            style: TextStyle(fontSize: 8, color: Colors.black),
          ),
        ],
      ),
      trailing: SizedBox(
        child: Column(
          children: [
            3.heightBox,
            CustomRatingBar(rating: 4),
            3.heightBox,
            const Text(
              '(230)',
              style: AppTheeme.normalSmallText,
            ),
            3.heightBox,
            const Text(
              Strings.timeJoin,
              style: TextStyle(fontSize: 8, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItemContainer() {
    return AspectRatio(
      aspectRatio: 20 / 8,
      child: Container(
        width: double.infinity,
        decoration: Styling.lightGreyDecoration(radius: 15),
      ),
    );
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
                        ? Styling.mainYellow
                        : Styling.lightGrey,
                    borderRadius: BorderRadius.circular(15)),
                child: const Center(
                  child: Text(
                    Strings.items,
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
                    Strings.reviews,
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
                child: const Center(
                  child: Text(
                    Strings.about,
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

  Widget _buildVendorItemsGrid() {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
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
                    child: const SizedBox(
                      height: 135,
                      child: SizedBox.expand(),
                    ),
                  ),
                  SvgPicture.asset(Images.roundedAFavIconOutlined),
                ],
              ),
              12.heightBox,
              const Text(
                '"PRODUCT name"',
                textAlign: TextAlign.start,
                style: AppTheeme.normalSmallText,
              ),
              8.heightBox,
              Row(
                children: [
                  const Text(
                    'AED 250',
                    textAlign: TextAlign.start,
                    style: AppTheeme.normalSmallerButtonText,
                  ),
                  const Spacer(),
                  SvgPicture.asset(Images.vendorPageShareIcon)
                ],
              ),
              _buildAddToCartButton(context)
            ],
          ),
        );
      },
    );
  }

  Widget _buildAddToCartButton(context) {
    return SizedBox(
      height: 30,
      child: RawMaterialButton(
        fillColor: Styling.darkGrey,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(Images.cartIconWhite),
            3.widthBox,
            Text(
              Strings.addToCart,
              style: AppTheeme.normalSmallerButtonText
                  .copyWith(color: Colors.white),
            ).p(5),
          ],
        ),
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
}
