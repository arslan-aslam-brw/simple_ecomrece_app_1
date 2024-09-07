import 'package:flutter/material.dart';
import 'package:simple_ecomrece_app_1/pages/home_page_product.dart';
import 'package:simple_ecomrece_app_1/pages/item_cart_page.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  /// currentPage var is by default selected one fisrt page
  int currentPage = 0;

  /// Creating list of pages for move from botomnavigation
  List<Widget> pages = const [HomePageProduct(), CartItems()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// passing current list items in pages
      /// body: pages[currentPage],
      /// IndexedStack is used for stack content on page
      /// means when we move to next page, content not restart and start where we left
      body: IndexedStack(
        index: currentPage,

        /// Childeren is widget type and pages is also is widget, so we pas it easily
        children: pages,
      ),

      bottomNavigationBar: BottomNavigationBar(
        iconSize: 25,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        elevation: 0,

        /// its required and giving it a value of current page
        currentIndex: currentPage,

        /// when onTap it moves to another page
        onTap: (value) {
          setState(() {
            /// passing pages to value for moving
            currentPage = value;
          });
        },
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
              icon: const Icon(
                Icons.home,
              ),
              label: '',
              backgroundColor: Theme.of(context).colorScheme.primary),
          const BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart,
              ),
              label: '',
              backgroundColor: Colors.white),
        ],
      ),
    );
  }
}
