// ignore_for_file: must_be_immutable, use_build_context_synchronously, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:upliftu/home_page1.dart';
import 'package:upliftu/login_pages/sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upliftu/reuse.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _fullnameTextController = TextEditingController();

  String? _emailError;
  String? _passwordError;
  String? _fullnameError;

  Future<void> saveFullName(String fullName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('fullName', fullName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD8B4F8),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 28, top: 120, right: 28),
              child: Container(
                width: 330,
                height: 250,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/loginPage.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 30),
                  reusableTextField(
                    "Enter First Name",
                    Icons.person_outline,
                    false,
                    _fullnameTextController,
                    errorText: _fullnameError,
                  ),
                  const SizedBox(height: 20),
                  reusableTextField(
                    "Enter Email",
                    Icons.person_2,
                    false,
                    _emailTextController,
                    errorText: _emailError,
                  ),
                  const SizedBox(height: 20),
                  reusableTextField(
                    "Enter Password",
                    Icons.lock_outline,
                    true,
                    _passwordTextController,
                    errorText: _passwordError,
                  ),
                  const SizedBox(height: 25),
                  ElevatedButton(
                    onPressed: () async {
                      // Validate inputs before saving and navigating
                      bool isValid = validateInputs();

                      if (isValid) {
                        // Save the full name to shared preferences
                        await saveFullName(_fullnameTextController.text);

                        // Navigate to the home page
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const homePage()),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFAA77FF),
                      minimumSize: const Size(70, 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                        side: const BorderSide(color: Color(0xFFAA77FF), width: 2),
                      ),
                    ),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 5),
                  signInOption(context),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget signInOption(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Already have an account?",
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SignIn()),
            );
          },
          child: const Text(
            " Sign In",
            style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  bool validateInputs() {
    // Reset error messages
    _emailError = null;
    _passwordError = null;
    _fullnameError = null;

    // Validate full name
    if (_fullnameTextController.text.isEmpty) {
      setState(() {
        _fullnameError = "First name field is required";
      });
    }

    // Validate email
    if (_emailTextController.text.isEmpty) {
      setState(() {
        _emailError = "Email field is required";
      });
    } else if (!isValidEmail(_emailTextController.text)) {
      setState(() {
        _emailError = "Invalid email id";
      });
    }

    // Validate password
    if (_passwordTextController.text.isEmpty) {
      setState(() {
        _passwordError = "Password field is required";
      });
    }

    // Return validation result
    return _emailError == null && _passwordError == null && _fullnameError == null;
  }

  bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegex.hasMatch(email);
  }
}
