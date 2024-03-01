import 'package:flutter/material.dart';
import 'package:rxmed/screens/register_screen.dart';
import 'home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController email_;
  late final TextEditingController password_;
  @override
  void initState() {
    email_ = TextEditingController();
    password_ = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    email_.dispose();
    password_.dispose();
    super.dispose();
  }

  bool show_password = false;
  String email_error = "";
  String password_error = "";
  String general_error = "";
  bool show_usersignin_success = false;

  void changeShowPassword(bool bl) {
    setState(() {
      show_password = bl;
      changeEmailError("");
      changePasswordError("");
      changeGeneralError("");
    });
  }

  void changeEmailError(String str) {
    setState(() {
      email_error = str;
    });
  }

  void changePasswordError(String str) {
    setState(() {
      password_error = str;
    });
  }

  void changeGeneralError(String str) {
    setState(() {
      general_error = str;
    });
  }

  void changeUserCrtSuccess(bool bl) {
    setState(() {
      show_usersignin_success = bl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 162, 32),
        title: const Text("Login"),
      ),
      body: ListView(children: [
        (!show_usersignin_success)
            ? Container()
            : Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 20,
                  bottom: 0,
                ),
                child: Row(children: [
                  const Icon(
                    Icons.check_circle,
                    size: 25.0,
                    color: Colors.green,
                  ),
                  Text(
                    " Login Successful",
                    style: GoogleFonts.notoSans(
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ]),
              ),
        (general_error == "")
            ? Container()
            : Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 10,
                  bottom: 0,
                ),
                child: Row(children: [
                  const Icon(
                    Icons.error,
                    size: 25.0,
                    color: Colors.red,
                  ),
                  Text(
                    " $general_error",
                    style: GoogleFonts.notoSans(
                      textStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(147, 255, 0, 0),
                      ),
                    ),
                  ),
                ]),
              ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 25,
              right: 20,
              top: 25,
              bottom: 20,
            ),
            child: Row(children: [
              const Icon(
                Icons.email,
                size: 25.0,
                color: Colors.green,
              ),
              Text(
                ' Email',
                style: GoogleFonts.notoSans(
                  textStyle: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 162, 32),
                  ),
                ),
              ),
            ]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
            top: 10,
            bottom: 10,
          ),
          child: TextField(
            controller: email_,
            enableSuggestions: false,
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            style: GoogleFonts.notoSans(
              textStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 162, 32),
              ),
            ),
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.green,
                  width: 2.0,
                ),
              ),
              hintText: 'Enter Email',
              hintStyle: TextStyle(
                color: Color.fromARGB(123, 0, 137, 27),
              ),
            ),
          ),
        ),
        (email_error == "")
            ? Container()
            : Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 0,
                  bottom: 5,
                ),
                child: Row(children: [
                  const Icon(
                    Icons.error,
                    size: 25.0,
                    color: Colors.red,
                  ),
                  Text(
                    " $email_error",
                    style: GoogleFonts.notoSans(
                      textStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(147, 255, 0, 0),
                      ),
                    ),
                  ),
                ]),
              ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 25,
              right: 20,
              top: 20,
              bottom: 20,
            ),
            child: Row(children: [
              const Icon(
                Icons.key,
                size: 25.0,
                color: Colors.green,
              ),
              Text(
                ' Password',
                style: GoogleFonts.notoSans(
                  textStyle: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 162, 32),
                  ),
                ),
              ),
            ]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
            top: 10,
            bottom: 10,
          ),
          child: TextField(
            controller: password_,
            obscureText: !show_password,
            enableSuggestions: false,
            autocorrect: false,
            style: GoogleFonts.notoSans(
              textStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 162, 32),
              ),
            ),
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.green,
                  width: 2.0,
                ),
              ),
              hintText: 'Enter Password',
              hintStyle: TextStyle(
                color: Color.fromARGB(123, 0, 137, 27),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 15,
          ),
          child: Row(children: [
            Checkbox(
              value: show_password,
              activeColor: Colors.green,
              onChanged: (bool) {
                if (show_password) {
                  changeShowPassword(false);
                } else {
                  changeShowPassword(true);
                }
              },
            ),
            Text(
              "Show Password",
              style: GoogleFonts.notoSans(
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),
          ]),
        ),
        (password_error == "")
            ? Container()
            : Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 0,
                  bottom: 5,
                ),
                child: Row(children: [
                  const Icon(
                    Icons.error,
                    size: 25.0,
                    color: Colors.red,
                  ),
                  Text(
                    " $password_error",
                    style: GoogleFonts.notoSans(
                      textStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(147, 255, 0, 0),
                      ),
                    ),
                  ),
                ]),
              ),
        Padding(
          padding: const EdgeInsets.only(
            top: 20,
            left: 25,
            bottom: 10,
            right: 10,
          ),
          child: Row(children: [
            Text(
              'Not Registered? ',
              style: GoogleFonts.notoSans(
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(148, 65, 71, 67),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return RegisterScreen();
                }));
              },
              child: Text(
                'Register',
                style: GoogleFonts.notoSans(
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(197, 0, 162, 22),
                  ),
                ),
              ),
            )
          ]),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 30,
            left: 60,
            bottom: 30,
            right: 60,
          ),
          child: OutlinedButton(
            onPressed: () async {
              final email = email_.text;
              final password = password_.text;
              print("Email entered by user : ${email}");
              print("Password entered by user : ${password}");
              try {
                final userCredential = await FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                        email: email, password: password);
                print("UserCredential : $userCredential");
                final user = FirebaseAuth.instance.currentUser;
                if (user != null) {
                  if (user.emailVerified) {
                    changeUserCrtSuccess(true);
                    changeEmailError("");
                    changePasswordError("");
                    changeGeneralError("");
                    // ignore: use_build_context_synchronously
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return HomeScreen();
                    }));
                  } else {
                    await (FirebaseAuth.instance.currentUser)
                        ?.sendEmailVerification();
                    await FirebaseAuth.instance.signOut();
                    changeEmailError("");
                    changePasswordError("");
                    changeGeneralError(
                        " Email Not Verified!\n  Verification Email Send to this Email.");
                  }
                }
              } catch (e) {
                changeUserCrtSuccess(false);
                if (e is FirebaseAuthException) {
                  if (e.code == "invalid-email") {
                    changeEmailError(
                        "Invalid Email! Make sure it's a valid email");
                    changePasswordError("");
                    changeGeneralError("");
                  } else if (e.code == "user-disabled") {
                    changeEmailError(
                        "This User is Disabled! write to us to enable");
                    changePasswordError("");
                    changeGeneralError("");
                  } else if (e.code == "user-not-found") {
                    changeEmailError("User not found!");
                    changePasswordError("");
                    changeGeneralError("");
                  } else if (e.code == "wrong-password") {
                    changeEmailError("");
                    changePasswordError("Wrong Password!");
                    changeGeneralError("");
                  } else if (e.code == "operation-not-allowed") {
                    changeEmailError("");
                    changePasswordError("");
                    changeGeneralError("Not Allowed!");
                  } else if (e.code == "network-request-failed") {
                    changeEmailError("");
                    changePasswordError("");
                    changeGeneralError("Network Request Failed!");
                  } else if (e.code == "too-many-requests") {
                    changeEmailError("");
                    changePasswordError("");
                    changeGeneralError("Too Many Requests!");
                  } else {
                    changeEmailError("");
                    changePasswordError("");
                    changeGeneralError(e.code);
                    print(e);
                  }
                }
              }
            },
            style: OutlinedButton.styleFrom(
              fixedSize: Size(70, 50),
              backgroundColor: Color.fromARGB(30, 8, 162, 0),
              side: const BorderSide(
                  width: 3.0, color: Color.fromARGB(255, 0, 162, 32)),
            ),
            child: Text(
              'Login',
              style: GoogleFonts.notoSans(
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 162, 32),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
