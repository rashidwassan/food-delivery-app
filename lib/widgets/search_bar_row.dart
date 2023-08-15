import 'package:flappy_search_bar_ns/scaled_tile.dart';
import 'package:flappy_search_bar_ns/search_bar_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sayfood/styles/app_theme.dart';
import 'package:sayfood/styles/images.dart';
import 'package:sayfood/styles/strings.dart';
import 'package:sayfood/styles/styling.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flappy_search_bar_ns/flappy_search_bar_ns.dart';

Widget searchBarRow({bool includeFilterIcon = true}) {
  return Row(
    children: [
      Container(
        height: 80,
        decoration: BoxDecoration(
            color: Styling.lightGrey, borderRadius: BorderRadius.circular(30)),
      )
    ],
  );
  // : Row(
  //     children: [
  //       Flexible(
  //         child: SizedBox(
  //           height: 80,
  //           child: SearchBar<Post>(
  //             textStyle: AppTheeme.homePageSmallText,
  //             searchBarStyle: SearchBarStyle(
  //                 padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
  //                 backgroundColor: Styling.lightGrey,
  //                 borderRadius: BorderRadius.circular(30)),
  //             hintText: Strings.homepageSearchHint,
  //             hintStyle:
  //                 AppTheeme.homePageSmallText.copyWith(color: Colors.grey),
  //             listPadding: const EdgeInsets.symmetric(horizontal: 10),
  //             onSearch: (item) {},
  //             //  searchBarController: _searchBarController,
  //             searchBarPadding: const EdgeInsets.all(0),
  //             indexedScaledTileBuilder: (int index) =>
  //                 ScaledTile.count(1, index.isEven ? 2 : 1),
  //             icon: SvgPicture.asset(Images.searchIcon),
  //             onCancelled: () {
  //               print("Cancelled triggered");
  //             },
  //             mainAxisSpacing: 10,
  //             crossAxisSpacing: 10,
  //             crossAxisCount: 2,
  //             onItemFound: (Post post, int index) {
  //               return Container(
  //                 color: Colors.lightBlue,
  //                 child: ListTile(
  //                   title: Text(post.title),
  //                   subtitle: Text(post.body),
  //                   onTap: () {},
  //                 ),
  //               );
  //             },
  //           ),
  //         ),
  //       ),
  //       (includeFilterIcon) ? 24.widthBox : const SizedBox.shrink(),
  //       (includeFilterIcon)
  //           ? InkWell(
  //               splashColor: Colors.transparent,
  //               highlightColor: Colors.transparent,
  //               onTap: () {},
  //               child: Container(
  //                 decoration: Styling.lightGreyDecoration(radius: 10),
  //                 child: SvgPicture.asset(Images.filterIcon).p(12).px8(),
  //               ),
  //             )
  //           : const SizedBox.shrink()
  //     ],
  //   );
}

class Post {
  dynamic title;
  dynamic body;
}
