
import 'package:flutter/material.dart';
import 'package:sayfood/styles/strings.dart';
import 'package:sayfood/widgets/new_products_vendors_appbar.dart';
import 'package:sayfood/widgets/product_view_tile.dart';
import 'package:velocity_x/velocity_x.dart';

class NewVendorsListPage extends StatelessWidget {
  const NewVendorsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            4.heightBox,
            buildNewProductsAndVendorsAppbar(title: Strings.newVendors),
            16.heightBox,
            ListView.builder(
              itemCount: 6,
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
        ),
      ),
    );
  }
}
