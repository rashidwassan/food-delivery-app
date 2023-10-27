import 'package:flutter/material.dart';
import 'package:sayfood/styles/strings.dart';
import 'package:sayfood/widgets/new_products_vendors_appbar.dart';
import 'package:sayfood/widgets/product_view_tile.dart';
import 'package:velocity_x/velocity_x.dart';

class AllNewProductsGridPage extends StatelessWidget {
  const AllNewProductsGridPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            4.heightBox,
            buildNewProductsAndVendorsAppbar(title: Strings.newProducts),
            GridView.builder(
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
                return SizedBox(
                    width: 155,
                    height: 155,
                    child: buildDealsViewWithBottomTitle(title: " ").px(4));
              },
            ).p(16)
          ],
        ),
      ),
    );
  }
}
