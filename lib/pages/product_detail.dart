import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
              height: 170,
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
                    itemCount: (widget.product['sizes'] as List<int>).length,
                    itemBuilder: (context, index) {
                      final size =
                          (widget.product['sizes'] as List<int>)[index];
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
                        minimumSize: const MaterialStatePropertyAll(
                            Size(double.infinity, 40))),
                    onPressed: () {},
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
