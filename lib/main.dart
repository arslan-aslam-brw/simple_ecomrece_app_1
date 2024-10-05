import 'package:flutter/material.dart';
import 'package:simple_ecomrece_app_1/pages/bottom_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:simple_ecomrece_app_1/widgets/cart_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    /// Provider is a type of state Managment if flutter. 1 Provider 2. chnagenotify provider
    /// 3. future provider and stream provider. its a wraper class , inherited class use for temporary
    /// data store in app. For use it, improt its library in pubspec dependences.
    /// is used to store data and also used for some logical problem extraction from UI like form page
    /// validation, some conditions etc.

    /// we using provider
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        /// Theming Our App For All Pages
        theme: ThemeData(
          /// Fonts for All Pages
          fontFamily: 'Lato',

          /// Giving Color to Our App
          colorScheme: ColorScheme.fromSeed(
            primary: const Color.fromRGBO(69, 191, 8, 1),
            secondary: const Color.fromRGBO(69, 191, 8, 1),
            seedColor: const Color.fromRGBO(69, 191, 8, 1),
          ),
          useMaterial3: true,

          /// I setting hint style for my all pages
          inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            prefixIconColor: Color.fromRGBO(69, 191, 8, 1),
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
        home: const BottomNavBar(),
      ),
    );
  }
}
