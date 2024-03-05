// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:upliftu/home_page1.dart';
import 'package:upliftu/login_pages/sign_up.dart';
import 'package:upliftu/reuse.dart';
//import 'package:upliftu/user_survey.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();

  String? _emailError;
  String? _passwordError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD8B4F8),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign In",
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView( 
      child: Padding(
        padding: const EdgeInsets.only(left: 30, top: 70, right: 30 , bottom: 40),
        child: Column(
          children: <Widget>[
            Container(
              width: 330,
              height: 250,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/loginPage.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 30),
            
            reusableTextField(
              "Enter Email",
              Icons.person_outline,
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
            buildSignInButton(),
            const SizedBox(height: 5),
            signUpOption(context),
          ],
        ),
      ),
    ),
    );
  }

  ElevatedButton buildSignInButton() {
    return ElevatedButton(
      onPressed: () {
        // Validate email and password before navigating
        bool isValid = validateInputs();

        if (isValid) {
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
        'Sign In',
        style: TextStyle(fontSize: 22, color: Colors.white),
      ),
    );
  }

  Row signUpOption(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account?", style: TextStyle(fontSize: 16 , color: Colors.black)),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SignUpScreen()),
            );
          },
          child: const Text(
            " Sign Up",
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
  return _emailError == null && _passwordError == null;
}


  bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegex.hasMatch(email);
  }
}
