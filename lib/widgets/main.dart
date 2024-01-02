import 'package:flutter/material.dart';
import 'package:simple_ecomrece_app_1/pages/home_page.dart';

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
          primary: const Color.fromRGBO(254, 206, 1, 1),
          secondary: const Color.fromRGBO(254, 206, 1, 1),
          seedColor: const Color.fromRGBO(254, 206, 1, 1),
        ),
        useMaterial3: true,

        /// I setting hint style for my all pages
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
        ),

        /// textTheme
        textTheme: const TextTheme(
          titleMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          titleSmall: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          titleLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
        ),
      ),
      home: const HomePage(),
    );
  }
}
