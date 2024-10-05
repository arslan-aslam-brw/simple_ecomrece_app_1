import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_ecomrece_app_1/widgets/cart_provider.dart';

class ProductDetailScreen extends StatefulWidget {
  final Map<String, Object> product;

  const ProductDetailScreen({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int isSelectSize = 0;

  /// we use condition and calling provider stored instance from CartProvider Class
  void onTap() {
    if (isSelectSize != 0) {
      /// using provider
      /// Provider.of<CartProvider>(context, listen: false).addProduct( we can use this in shorten also
      context.read<CartProvider>().addProduct({
        'id': widget.product['id'],
        'title': widget.product['title'],
        'item': widget.product['item'],
        'price': widget.product['price'],
        'imageUrl': widget.product['imageUrl'],
        'quantity': isSelectSize,
      });

      /// This is is like a Notification message on Screen
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Item Added To Cart",
            style: TextStyle(color: Colors.white),
          ),
          elevation: 5.0,
          duration: Durations.long4,
          padding: EdgeInsets.all(10),
          backgroundColor: Colors.cyan,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Please Select Item",
            style: TextStyle(color: Colors.white),
          ),
          elevation: 5.0,
          duration: Durations.long4,
          padding: EdgeInsets.all(10),
          backgroundColor: Colors.cyan,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Details',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              widget.product['title'] as String,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 230,
              width: 230,
              decoration: BoxDecoration(
                image: DecorationImage(

                    /// if image in mobile, or web, for web, we use ImageNetwork
                    image: kIsWeb
                        ? NetworkImage(widget.product['imageUrl'] as String)
                        : AssetImage(widget.product['imageUrl'] as String)
                            as ImageProvider<Object>,
                    fit: BoxFit.cover,
                    alignment: Alignment.center),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          const Spacer(
            flex: 2,
          ),
          Container(
            height: 210,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: const Color.fromARGB(255, 237, 246, 249),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${widget.product['price']}\$",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(
                  height: 70,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: (widget.product['quantity'] as List<int>).length,
                    itemBuilder: (context, index) {
                      final size =
                          (widget.product['quantity'] as List<int>)[index];
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            isSelectSize = size;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Chip(
                            backgroundColor: isSelectSize == size
                                ? Theme.of(context).colorScheme.primary
                                : null,
                            label: Text(
                              size.toString(),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  child: ElevatedButton.icon(
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          Theme.of(context).primaryColor,
                        ),
                        fixedSize:
                            const MaterialStatePropertyAll(Size(350, 50))),
                    onPressed: () {
                      /// here we calling provider, cartProvider function for when press button
                      ///  details move to another screen, page.
                      onTap();
                    },
                    icon: const Icon(
                      Icons.shopping_cart,
                      color: Colors.black,
                    ),
                    label: const Text(
                      'Add to Cart',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
