import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_ecomrece_app_1/widgets/cart_provider.dart';

class CartItems extends StatelessWidget {
  const CartItems({super.key});

  @override
  Widget build(BuildContext context) {
    /// calling provider instance that is we used to store data
    /// final cart = Provider.of<CartProvider>(context).cart;

    /// we can aslo use this code for shorten and easy
    final cart = context.watch<CartProvider>().cart;

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Cart",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        body: Center(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: cart.length,
            itemBuilder: (context, index) {
              final cartList = cart[index];

              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(cartList['imageUrl'] as String),
                  radius: 30,
                ),
                trailing: IconButton(
                  onPressed: () {
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return AlertDialog.adaptive(
                          title: Text(
                            "Removing Product",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          content: Text(
                            "Are You Sure You Want To Remove This Product From Cart?",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                "No",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Provider.of<CartProvider>(context,
                                        listen: false)
                                    .removeProduct(cartList);
                                Navigator.pop(context);

                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      "Item Removed!",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    elevation: 5.0,
                                    padding: EdgeInsets.all(10),
                                    backgroundColor: Colors.cyan,
                                  ),
                                );
                              },
                              child: const Text(
                                "Yes",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  icon: const Icon(Icons.delete),
                  color: Colors.red,
                ),
                title: Text("${cartList['title']}",
                    style: Theme.of(context).textTheme.titleMedium),
                subtitle: Text(
                  "quantity: ${cartList['quantity']}",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              );
            },
          ),
        ));
  }
}
