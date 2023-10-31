import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sayfood/pages/cart.dart';
import 'package:sayfood/pages/categories_page.dart';
import 'package:sayfood/pages/home_page.dart';
import 'package:sayfood/pages/my_account.dart';
import 'package:sayfood/pages/search_screen.dart';
import 'package:sayfood/provider/cart_items_provider.dart';
import 'package:sayfood/styles/images.dart';
import 'package:sayfood/widgets/main_yellow_appbar.dart';
import 'package:velocity_x/velocity_x.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, this.child});
  final Widget? child;
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> _pages = [
    const HomePage(),
    const SearchScreen(),
    const CategoriesScreen(),
    const MyAccount(),
    const CartScreen(),
  ];
  late int _currentPage;
  final int _notifications = 1;

  @override
  void initState() {
    super.initState();
    _currentPage = (widget.child != null) ? -1 : 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: mainYellowAppbar(notifications: _notifications, context: context),
      body: ScrollConfiguration(
        behavior: const ScrollBehavior(),
        child: Column(
          children: [
            Expanded(
              child:
                  (_currentPage == -1) ? widget.child! : _pages[_currentPage],
            ),
            _buildBottomBar(context: context),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomBar({required BuildContext context}) {
    return SizedBox(
      height: 80,
      child: Row(
        children: [
          _bottomBarButton(context: context, icon: Images.home, indexValue: 0),
          _bottomBarButton(
              context: context, icon: Images.searchIconBottom, indexValue: 1),
          _buildMiddleBottomBarButton(),
          _bottomBarButton(
              context: context, icon: Images.person, indexValue: 3),
          _bottomBarButton(context: context, icon: Images.cart, indexValue: 4),
        ],
      ).px(16),
    );
  }

  Widget _buildMiddleBottomBarButton() {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _currentPage = 2;
          });
        },
        child: Image.asset(
          Images.middleBottomButton,
        ),
      ),
    );
  }

  Widget _bottomBarButton(
      {required BuildContext context,
      required String icon,
      required int indexValue}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentPage = indexValue;
        });
      },
      child: (indexValue != 4)
          ? SizedBox(
              width: context.percentWidth * 17,
              child: SvgPicture.asset(
                icon,
                color:
                    _currentPage == indexValue ? Colors.purple.shade600 : null,
              ),
            ).pOnly(bottom: 8)
          : Consumer<CartItemsProvider>(
              builder: (ctx, val, child) => Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: context.percentWidth * 17,
                    child: SvgPicture.asset(
                      icon,
                      color: _currentPage == indexValue
                          ? Colors.purple.shade600
                          : null,
                    ),
                  ).pOnly(bottom: 8),
                  if (val.cartItems.isNotEmpty)
                    Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.red),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(
                            val.cartItems.length.toString(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 10),
                          ),
                        ),
                      ),
                    )
                ],
              ),
            ),
    );
  }
}
