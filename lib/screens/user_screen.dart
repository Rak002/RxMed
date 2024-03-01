import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rxmed/screens/login_screen.dart';
import '../components/ui_components.dart';

class userScreen extends StatelessWidget {
  const userScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(context),
      body: ListView(
        children: [
          Container(
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Padding(
                padding: EdgeInsets.only(
                  left: 10,
                  top: 10,
                  right: 5,
                  bottom: 10,
                ),
                child: Icon(
                  Icons.image,
                  size: 90.0,
                  color: Colors.green,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 5,
                  top: 20,
                  right: 10,
                  bottom: 10,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name",
                        style: GoogleFonts.notoSans(
                          textStyle: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 41, 188, 0),
                          ),
                        ),
                      ),
                      Text(
                        "${(FirebaseAuth.instance.currentUser)?.email}",
                        style: GoogleFonts.notoSans(
                          textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 41, 188, 0),
                          ),
                        ),
                      ),
                    ]),
              ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 140,
              top: 10,
              right: 140,
              bottom: 10,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: TextButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  // ignore: use_build_context_synchronously
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return LoginScreen();
                  }));
                },
                child: Text(
                  'Log Out',
                  style: GoogleFonts.notoSans(
                    textStyle: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
