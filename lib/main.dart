import 'package:flutter/material.dart';
import 'package:simple_ecomrece_app_1/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      /// Theming Our App For All Pages
      theme: ThemeData(
        /// Fonts for All Pages
        fontFamily: 'Lato',

        /// Giving Color to Our App
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(254, 206, 1, 1),
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
