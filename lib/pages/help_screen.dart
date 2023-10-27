import 'package:flutter/material.dart';
import 'package:sayfood/pages/main_screen.dart';
import 'package:sayfood/styles/app_theme.dart';
import 'package:sayfood/styles/strings.dart';
import 'package:sayfood/styles/styling.dart';
import 'package:sayfood/widgets/new_products_vendors_appbar.dart';
import 'package:velocity_x/velocity_x.dart';

class HelpScreen extends StatefulWidget {
  static const String id = '/HelpScreen';

  const HelpScreen({super.key});
  @override
  _HelpScreenState createState() => _HelpScreenState();
}

int _currentExpanded = 0;

class _HelpScreenState extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {
    return MainPage(
      child: Column(
        children: [
          buildNewProductsAndVendorsAppbar(height: 45, title: Strings.help),
          16.heightBox,
          Expanded(
            child: ListView.builder(
                itemCount: 8,
                itemBuilder: (context, index) {
                  return _buildHelpCaseTile(
                      title: ('${Strings.casse}  $index'),
                      solution: Strings.caseOneSol,
                      index: index);
                }),
          ),
        ],
      ),
    );
  }

  Widget _buildHelpCaseTile(
      {required String title, required String solution, required int index}) {
    return Column(
      children: [
        MaterialButton(
          height: 55,
          color: Styling.lightGrey,
          padding: const EdgeInsets.all(0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          onPressed: () {
            setState(() {
              _currentExpanded = index;
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: AppTheeme.normalButtonText,
              ),
              const Icon(
                Icons.keyboard_arrow_down,
                color: Colors.grey,
                size: 35,
              )
            ],
          ).px(16),
        ).pLTRB(24, 16, 24, 0),
        (_currentExpanded == index)
            ? Container(
                height: 70,
                width: double.infinity,
                decoration: Styling.lightGreyDecoration(radius: 15),
                child: Text(solution).p(16),
              ).pLTRB(24, 8, 24, 0)
            : const SizedBox.shrink(),
      ],
    );
  }
}
