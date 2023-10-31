import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sayfood/provider/cart_items_provider.dart';
import 'package:sayfood/route_generator.dart';
import 'package:sayfood/styles/styling.dart';

class SayFood extends StatelessWidget {
  const SayFood({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CartItemsProvider()),
        ],
        child: MaterialApp(
          theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              appBarTheme:
                  const AppBarTheme(color: Styling.mainPurple, elevation: 0)),
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          onGenerateRoute: RouteGenerator.generateRoute,
        ));
  }
}
