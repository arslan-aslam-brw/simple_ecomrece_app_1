import 'package:flutter/material.dart';
import 'package:simple_ecomrece_app_1/items_container.dart';
import 'package:simple_ecomrece_app_1/module_dummy_data.dart';
import 'package:simple_ecomrece_app_1/product_detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// Creating list of menu items in array
  final List<String> filters = const ['All', 'Pizza', 'Burger', 'Shwarma'];

  /// creating variable for saving states of menu
  late String selectedFilters;

  @override
  void initState() {
    super.initState();

    /// setting states to all
    selectedFilters = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    /// creating onetime widget for all same type properity like border, sameEnable border etc
    /// and stroting it in variable
    const border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromRGBO(225, 225, 225, 1),
      ),
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(50),
      ),
    );

    return Scaffold(
      /// safeArea widget is used to save our overall layout from top, notch, bottom buttons etc
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text("Fast Food\nCollection",
                      style: Theme.of(context).textTheme.titleLarge),
                ),

                /// expandig widget is used for to give particular widget same or more spaceor equally
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Icon(
                        Icons.search,
                      ),

                      /// calling border variable for same properties,
                      border: border,
                      enabledBorder: border,
                      focusedBorder: border,
                    ),
                  ),
                ),
              ],
            ),

            /// Giving size to our list view
            SizedBox(
              height: 120,
              child: ListView.builder(
                /// passing all array items
                itemCount: filters.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  /// storing items of array in variable for later use
                  final filter = filters[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),

                    /// GestureDetector widget is used for taping on particular thing,
                    /// used for taping, on ever where, more usefull for taping on things
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          /// passing or assining selectedFilter to all array items
                          /// like menu functionality
                          selectedFilters = filter;
                        });
                      },

                      /// Chip widget is mostly used for labling, custome labels,
                      /// Text decoration etc
                      child: Chip(
                        /// changing color on selected things
                        backgroundColor: selectedFilters == filter
                            ? Theme.of(context).colorScheme.primary
                            : const Color.fromRGBO(245, 247, 249, 1),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        label: Text(filter),
                        labelStyle: const TextStyle(fontSize: 16),
                        side: const BorderSide(
                          color: Color.fromRGBO(245, 247, 249, 1),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                  );
                },
              ),
            ),

            /// I used Expanding, because I want to show it on remaing full screen
            /// Because I not have plan or have any other thing aafter that so I use it
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  final product = products[index];

                  /// calling my created seprated widget with full created widget of container
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ProductDetailScreen(
                          product: products[index],
                        ),
                      ));
                    },
                    child: ProductCard(
                      /// caling constructor of my created widget
                      title: product['title'] as String,

                      /// fetching data from my created dummyData class like as fetch from jsonFile
                      /// or web API
                      price: product['price'] as double,
                      image: product['imageUrl'] as String,

                      /// Changing color of every widget
                      backgroundColor: index.isEven
                          ? const Color.fromRGBO(216, 240, 253, 1)
                          : const Color.fromARGB(255, 149, 151, 152),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedFontSize: 16.0,
        unselectedFontSize: 16.0,
        iconSize: 30,
        backgroundColor: const Color.fromARGB(214, 202, 245, 234),
        items: [
          BottomNavigationBarItem(
              icon: const Icon(
                Icons.home,
              ),
              label: 'Home',
              backgroundColor: Theme.of(context).colorScheme.primary),
          BottomNavigationBarItem(
              icon: const Icon(
                Icons.shopping_cart,
              ),
              label: 'Cart',
              backgroundColor: Theme.of(context).colorScheme.primary),
        ],
      ),
    );
  }
}
