import 'package:flutter/material.dart';
import 'package:sayfood/pages/about_app.dart';
import 'package:sayfood/pages/browse_favorites.dart';
import 'package:sayfood/pages/categories_page.dart';
import 'package:sayfood/pages/checkout.dart';
import 'package:sayfood/pages/code_activation.dart';
import 'package:sayfood/pages/delivery_addresses.dart';
import 'package:sayfood/pages/edit_delivery_address.dart';
import 'package:sayfood/pages/edit_profile.dart';
import 'package:sayfood/pages/favorites_screen.dart';
import 'package:sayfood/pages/help_screen.dart';
import 'package:sayfood/pages/main_screen.dart';
import 'package:sayfood/pages/my_orders.dart';
import 'package:sayfood/pages/new_products_grid_page.dart';
import 'package:sayfood/pages/new_vendors_list_page.dart';
import 'package:sayfood/pages/notifcation_screen.dart';
import 'package:sayfood/pages/order_details.dart';
import 'package:sayfood/pages/product_page.dart';
import 'package:sayfood/pages/restaurant_page.dart';
import 'package:sayfood/pages/restaurants_page.dart';
import 'package:sayfood/pages/search_panel_products.dart';
import 'package:sayfood/pages/select_category.dart';
import 'package:sayfood/pages/settings_screen.dart';
import 'package:sayfood/pages/sign_up.dart';
import 'package:sayfood/pages/splash_screen.dart';
import 'package:sayfood/pages/vendor_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case '/SignUp':
        return MaterialPageRoute(builder: (context) => const SignUp());
      case '/CodeActivation':
        return MaterialPageRoute(
          builder: (context) => const CodeActivation(),
        );
      case '/SelectCategory':
        return MaterialPageRoute(builder: (context) => const SelectCategory());
      case '/MainPage':
        return MaterialPageRoute(builder: (context) => const MainPage());
      case '/AllNewProductsGridPage':
        return MaterialPageRoute(
            builder: (context) => const MainPage(
                  child: AllNewProductsGridPage(),
                ));
      case '/AllNewVendorsListPage':
        return MaterialPageRoute(
            builder: (context) => const MainPage(
                  child: NewVendorsListPage(),
                ));
      case CheckoutScreen.id:
        return MaterialPageRoute(
            builder: (context) => MainPage(
                  child: CheckoutScreen(),
                ));

      case '/NotificationScreen':
        return MaterialPageRoute(builder: (context) => const NotificationsScreen());
      case MyOrdersScreen.id:
        return MaterialPageRoute(builder: (context) => const MyOrdersScreen());
      case OrderDetails.id:
        return MaterialPageRoute(builder: (context) => const OrderDetails());
      case DeliveryAddressesScreen.id:
        return MaterialPageRoute(
            builder: (context) => const DeliveryAddressesScreen());
      case FavoritesScreen.id:
        return MaterialPageRoute(builder: (context) => const FavoritesScreen());
      case SettingsScreen.id:
        return MaterialPageRoute(builder: (context) => const SettingsScreen());
      case AboutAppScreen.id:
        return MaterialPageRoute(builder: (context) => const AboutAppScreen());
      case HelpScreen.id:
        return MaterialPageRoute(builder: (context) => const HelpScreen());
      case CategoriesScreen.id:
        return MaterialPageRoute(builder: (context) => const CategoriesScreen());
      case BrowseFavorites.id:
        return MaterialPageRoute(builder: (context) => const BrowseFavorites());
      case EditProfileScreen.id:
        return MaterialPageRoute(builder: (context) => const EditProfileScreen());
      case EditDevliveryAddresses.id:
        return MaterialPageRoute(
            builder: (context) => const EditDevliveryAddresses());

      // Screeens which are not properly navigated yet

      case ProductPage.id:
        return MaterialPageRoute(builder: (context) => const ProductPage());
      case SearchPanelProductsPage.id:
        return MaterialPageRoute(
            builder: (context) => const SearchPanelProductsPage());
      case VendorsPage.id:
        return MaterialPageRoute(builder: (context) => const VendorsPage());
      case RestaurantPage.id:
        return MaterialPageRoute(builder: (context) => const RestaurantPage());
      case RestaurantsPage.id:
        return MaterialPageRoute(builder: (context) => const RestaurantsPage());

      default:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
    }
  }
}
