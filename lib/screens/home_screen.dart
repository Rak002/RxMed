import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/ui_components.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(context),
      body: CustomSectionsScrollview(const [
        "For You",
        "Most Ordered",
        "New Products",
      ]),
      bottomNavigationBar: Footer(),
    );
  }
}
