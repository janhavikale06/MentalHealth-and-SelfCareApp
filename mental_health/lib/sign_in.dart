import 'package:flutter/material.dart';
import 'package:mental_health/home_page.dart';
import 'package:mental_health/sign_up.dart';

// ignore: camel_case_types
class signIn extends StatelessWidget {
  const signIn({super.key});

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
                child: Column(
                  children: [
                    TextField(
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
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    TextField(
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
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(
                      height: 68,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const homePage()),
                        );
                        // Handle sign up button press
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
                        // Handle sign up button press
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
                          onPressed: () {},
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
          ],
        ),
      ),
    );
  }
}
