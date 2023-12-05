// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:mental_health/sign_up.dart';
import 'package:mental_health/reuse.dart';
import 'package:mental_health/home_page.dart';

class SignIn extends StatelessWidget {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();

  String? _emailError;
  String? _passwordError;

  SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD8B4F8),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign In",
          style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 28, top: 0, right: 28), // Adjust left and top values as needed
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
            const SizedBox(height: 35),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const homePage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFAA77FF),
                minimumSize: const Size(90, 40), // Adjust the size as needed
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                  side: const BorderSide(color: Color(0xFFAA77FF), width: 2),
                ),
              ),
              child: const Text(
                'Sign In',
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
            ),
            const SizedBox(height: 5),
            signUpOption(context),
          ],
        ),
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
              MaterialPageRoute(builder: (context) => SignUpScreen()),
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
}





/*
import 'package:flutter/material.dart';
import 'package:mental_health/home_page.dart';
import 'package:mental_health/sign_up.dart';
import 'package:email_validator/email_validator.dart';

// ignore: camel_case_types
class signIn extends StatefulWidget {
  const signIn({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<signIn> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _emailError;
  String? _passwordError;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/blob2.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 85, top: 130),
              child: const Text(
                'Welcome Back!',
                style: TextStyle(
                  fontSize: 42,
                  color: Color(0xFFAA77FF),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.47,
                right: 35,
                left: 35,
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          fillColor: const Color(0xFFD8B4F8),
                          filled: true,
                          hintText: 'Email',
                          hintStyle: const TextStyle(color: Color(0xFFAA77FF)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Color(0xFFAA77FF)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          errorText: _emailError,
                        ),
                        style: const TextStyle(color: Colors.white),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email is required';
                          } else if (!EmailValidator.validate(value)) {
                            return 'Invalid email format';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          fillColor: const Color(0xFFD8B4F8),
                          filled: true,
                          hintText: 'Password',
                          hintStyle: const TextStyle(color: Color(0xFFAA77FF)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Color(0xFFAA77FF)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          errorText: _passwordError,
                        ),
                        style: const TextStyle(color: Colors.white),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password is required';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 68,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // All fields are valid, continue with sign-in
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const homePage()),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF97DEFF),
                          minimumSize: const Size(200, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          side: const BorderSide(color: Color(0xFFAA77FF), width: 2),
                        ),
                        child: const Text(
                          'Sign In',
                          style: TextStyle(fontSize: 23, color: Color(0xFFAA77FF)),
                        ),
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const signUp()),
                              );
                            },
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFFAA77FF),
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              // Handle forgot password
                            },
                            child: const Text(
                              'Forgot Password',
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFFAA77FF),
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

*/
