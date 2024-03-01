import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/ui_components.dart';
import 'package:provider/provider.dart';
import '../models/item_model.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ItemModel>(builder: (context, value, child) {
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
                    "Payment",
                    style: GoogleFonts.notoSans(
                      textStyle: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                ),
                backgroundColor: const Color.fromARGB(151, 13, 156, 0),
                shadowColor: Colors.transparent,
              ),
              body: Container(
                  height: 1000,
                  child: ListView.builder(
                      itemCount: value.payment_methods.length + 1,
                      itemBuilder: (context, index) {
                        return (index != value.payment_methods.length)
                            ? Padding(
                                padding: EdgeInsets.only(
                                  top: ((index == 0) ? 30 : 10),
                                  bottom: 15,
                                  left: 20,
                                  right: 20,
                                ),
                                child: (InkWell(
                                  splashColor: Colors.transparent,
                                  onTap: () {
                                    Provider.of<ItemModel>(context,
                                            listen: false)
                                        .setSelectedMethod(index);
                                  },
                                  child: Container(
                                      decoration: BoxDecoration(
                                        color: Color.fromARGB(39, 30, 181, 0),
                                        border: Border.all(
                                          color:
                                              Color.fromARGB(255, 16, 165, 0),
                                          width: 4.0,
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      height: 90,
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                              left: 20,
                                            ),
                                            child: Container(
                                              width: 25,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: (value.selected_method ==
                                                        index)
                                                    ? (Color.fromARGB(
                                                        255, 30, 181, 0))
                                                    : (Color.fromARGB(
                                                        68, 30, 181, 0)),
                                                border: Border.all(
                                                  color: Color.fromARGB(
                                                      255, 16, 165, 0),
                                                  width: 4.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                              child: Align(
                                            alignment: Alignment.bottomLeft,
                                            child: Image.asset(
                                                'lib/images/fixed_images/${value.payment_methods[index]}.png'),
                                          ))
                                        ],
                                      )),
                                )),
                              )
                            : (Padding(
                                padding: EdgeInsets.only(
                                  top: 20,
                                  bottom: 20,
                                  left: 100,
                                  right: 100,
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: (value.paid)
                                        ? (Color.fromARGB(233, 18, 183, 0))
                                        : (Color.fromARGB(50, 22, 222, 0)),
                                    border: Border.all(
                                      color: Color.fromARGB(255, 16, 165, 0),
                                      width: 4.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  height: 50,
                                  child: InkWell(
                                    onTap: () => {
                                      Provider.of<ItemModel>(context,
                                              listen: false)
                                          .pay()
                                    },
                                    child: Align(
                                      alignment: Alignment.topCenter,
                                      child: Text(
                                        (!value.paid)
                                            ? ("Pay: ₹${Provider.of<ItemModel>(context, listen: false).calculateTotal()}")
                                            : ("Paid"),
                                        style: GoogleFonts.notoSans(
                                          textStyle: TextStyle(
                                            fontSize: 26,
                                            fontWeight: FontWeight.bold,
                                            color: (value.paid)
                                                ? (Color.fromARGB(
                                                    202, 255, 255, 255))
                                                : (Color.fromARGB(
                                                    255, 36, 164, 0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )));
                      })),
            );
          },
        ),
        bottomNavigationBar: const Footer(),
      );
    });
  }
}
