// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:mental_health/home_page.dart';
import 'package:mental_health/login_pages/sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mental_health/reuse.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _fullnameTextController = TextEditingController();

  String? _emailError;
  String? _passwordError;
  String? _fullnameError;

  SignUpScreen({Key? key}) : super(key: key);

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
          padding: const EdgeInsets.only(left: 28, top: 120, right: 28), // Adjust left and top values as needed
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
                    true,
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
                      // Save the full name to shared preferences
                      await saveFullName(_fullnameTextController.text);

                      // Navigate to the home page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const homePage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFAA77FF),
                      minimumSize: const Size(70, 40), // Adjust the size as needed
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
          style: TextStyle(fontSize: 16 , color: Colors.black),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignIn()),
            );
          },
          child: const Text(
            " Sign In",
            style: TextStyle(fontSize: 16 , color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
