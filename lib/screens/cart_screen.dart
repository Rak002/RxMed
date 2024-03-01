import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../components/ui_components.dart';
import '../models/item_model.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(context),
      body: Consumer<ItemModel>(
        builder: (context, value, child) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                ),
                child: Text(
                  "My Cart (${value.cart_items.length})",
                  style: GoogleFonts.notoSans(
                    textStyle: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(
                    right: 15,
                    left: 15,
                  ),
                  child: InkWell(
                    onTap: () {
                      Provider.of<ItemModel>(context, listen: false)
                          .clearCart();
                    },
                    child: Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.delete,
                          color: Colors.white,
                          size: 30.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
              backgroundColor: const Color.fromARGB(151, 13, 156, 0),
              shadowColor: Colors.transparent,
            ),
            body:
                // Using ternary operation check if the cart is empty
                (value.cart_items.isNotEmpty)
                    ? Scrollbar(
                        thickness: 8,
                        radius: const Radius.circular(10),
                        interactive: true,
                        child: (ListView.builder(
                            itemCount: value.cart_items.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                    right: 10,
                                    top: 10,
                                    bottom: 10,
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color:
                                          const Color.fromARGB(86, 17, 255, 0),
                                    ),
                                    height: 100,
                                    child: AppBar(
                                      toolbarHeight: 100,
                                      backgroundColor: Colors.transparent,
                                      shadowColor: Colors.transparent,
                                      title: Row(
                                        children: [
                                          Container(
                                            width: 33,
                                            child: Text(
                                              "${index + 1}.  ", // the function capitalizeWords is a custom function defined in item_model.dart
                                              style: GoogleFonts.notoSans(
                                                textStyle: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 43, 136, 0),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 80,
                                            height: 80,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: const Color.fromARGB(
                                                    220, 44, 189, 0),
                                                width: 3.0,
                                              ),
                                            ),
                                            child: ClipOval(
                                              child: Image.asset(
                                                  "lib/images/var_images/${value.cart_items[index][0]}.png",
                                                  fit: BoxFit.cover,
                                                  errorBuilder: (BuildContext
                                                          context,
                                                      Object error,
                                                      StackTrace? stackTrace) {
                                                return Image.asset(
                                                    'lib/images/var_images/not_found.png');
                                              }),
                                            ),
                                          ),
                                        ],
                                      ),
                                      flexibleSpace: Padding(
                                        padding: const EdgeInsets.only(
                                          left: 125,
                                        ),
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Container(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    left: 10,
                                                    right: 10,
                                                    top: 10,
                                                    bottom: 5,
                                                  ),
                                                  child: Text(
                                                    capitalizeWords(value
                                                        .cart_items[index][0]
                                                        .toString()), // the function capitalizeWords is a custom function defined in item_model.dart
                                                    style: GoogleFonts.notoSans(
                                                      textStyle:
                                                          const TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Color.fromARGB(
                                                            255, 43, 136, 0),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    left: 10,
                                                    right: 10,
                                                    top: 5,
                                                  ),
                                                  child: Text(
                                                    "${capitalizeWords(value.cart_items[index][1].toString())} - ₹${value.cart_items[index][2].toString()}",
                                                    style: GoogleFonts.notoSans(
                                                      textStyle:
                                                          const TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Color.fromARGB(
                                                            170, 43, 136, 0),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      actions: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            right: 15,
                                            left: 15,
                                          ),
                                          child: InkWell(
                                            onTap: () {
                                              Provider.of<ItemModel>(context,
                                                      listen: false)
                                                  .removeItemFromCart(index);
                                            },
                                            child: Container(
                                              width: 40.0,
                                              height: 40.0,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.green,
                                              ),
                                              child: const Center(
                                                child: Icon(
                                                  Icons.remove,
                                                  color: Colors.white,
                                                  size: 30.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ));
                            })),
                      )
                    : Align(
                        alignment: Alignment.center,
                        child: (Text(
                          "Empty",
                          style: GoogleFonts.notoSans(
                            textStyle: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(85, 59, 59, 59),
                            ),
                          ),
                        )),
                      ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.only(
                right: 0,
                left: 0,
                top: 0,
                bottom: 0,
              ),
              child: Container(
                color: const Color.fromARGB(151, 13, 156, 0),
                height: 60,
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                        ),
                        child: Text(
                          "Total Price :",
                          style: GoogleFonts.notoSans(
                            textStyle: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          right: 30,
                        ),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "₹" +
                                Provider.of<ItemModel>(context, listen: false)
                                    .calculateTotal(),
                            style: GoogleFonts.notoSans(
                              textStyle: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: const Footer(),
    );
  }
}
