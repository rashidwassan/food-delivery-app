import 'package:flutter/material.dart';
import 'package:sayfood/route_generator.dart';
import 'package:sayfood/styles/styling.dart';

class SayFood extends StatelessWidget {
  const SayFood({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme:
              const AppBarTheme(color: Styling.mainYellow, elevation: 0)),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
