import 'package:flutter/material.dart';
import 'package:simple_ecomrece_app_1/pages/product_detail.dart';
import 'package:simple_ecomrece_app_1/widgets/items_container.dart';
import 'package:simple_ecomrece_app_1/widgets/module_dummy_data.dart';

class LayoutForWeb extends StatefulWidget {
  const LayoutForWeb({super.key});

  @override
  State<LayoutForWeb> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<LayoutForWeb> {
  @override
  Widget build(BuildContext context) {
    //// Layout builder is a layout that is used to create a responsive UI for mobile and web.
    ///it is better than MediaQuery because it allows us to modify UI with certain and given width and height.
    ///MeidaQuery is used for only devices based width and height like samsung has 6.6 inches and iPhone has 5.5 inches screen,
    ///so MediaQuery performe accordingly these sizes that is a bit challange for some casue. So use Layoutbuilder Widget.
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 650) {
          return GridView.builder(
            itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 2.0),
            itemBuilder: (context, index) {
              final product = products[index];

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
          );
        } else {
          return ListView.builder(
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
          );
        }
      },
    );
  }
}
