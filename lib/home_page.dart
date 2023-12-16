import 'package:flutter/material.dart';
import 'package:simple_ecomrece_app_1/items_container.dart';
import 'package:simple_ecomrece_app_1/module_dummy_data.dart';

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
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "Fast Food\nCollection",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ),

                /// expandig widget is used for to give particular widget same or more spaceor equally
                Expanded(
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
                          selectedFilters = filter;
                        });
                      },

                      /// Chip widget is mostly used for labling, custome labels,
                      /// Text decoration etc
                      child: Chip(
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

            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ProductCard(
                    title: product['title'] as String,
                    price: product['price'] as double,
                    image: product['imageUrl'] as String,
                    backgroundColor: index.isEven
                        ? const Color.fromRGBO(216, 240, 253, 1)
                        : const Color.fromARGB(255, 149, 151, 152),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
