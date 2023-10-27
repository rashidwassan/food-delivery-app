// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:provider/provider.dart';
// import 'package:sayfood/models/categories_models.dart';
//
// class MyProvider extends ChangeNotifier {
//   List<CategoriesModel> categoriesList = [];
//   late CategoriesModel categoriesModel;
//   Future<void> getCategories() async {
//     List<CategoriesModel>  newCategoriesList = [];
//     await FirebaseFirestore.instance
//         .collection('categories')
//         .doc('fDykJeJN4bv4iAO8xLfg')
//         .collection('burgers')
//         .get().then((querySnapshot) {
//       if(querySnapshot.docs.isNotEmpty)
//       {
//         querySnapshot.docs.forEach(
//                 (element) {
//               categoriesModel = CategoriesModel(
//                   image: element.data()['image'], name: element.data()['name']
//               );
//               print(categoriesList);
//               newCategoriesList.add(categoriesModel);
//               categoriesList = newCategoriesList;
//             });
//       }
//     });
//
//
//   }
//   get throwList{
//     return categoriesList;
//   }
// }
