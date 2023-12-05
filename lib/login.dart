
/*

import 'package:flutter/material.dart';
import 'package:mental_health/sign_up.dart';
import 'package:mental_health/sign_in.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    const String login = 'assets/images/loginPage.png';

    return Scaffold(
      backgroundColor: const Color(0xFFD8B4F8),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 110.0, 10.0, 0), // Add top padding
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              // This Container will serve as the background with the specified color
              color: const Color(0xFFD8B4F8),
            ),
            ClipOval( // Use ClipOval to make the image circular
              child: Image.asset(
                login,
                width: 350, // Set the desired width
                height: 350, // Set the desired height
                fit: BoxFit.cover, // Cover the circular space
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const signUp()), // Replace SignUp with the appropriate widget
                    );
                    // Handle sign up button press
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFAA77FF), // Background color
                    minimumSize: const Size(180, 60), // Button size
                  ),
                  child: const Text(
                    'Sign up',
                    style: TextStyle(fontSize: 24), // Increase font size
                  ),
                ),
                const SizedBox(height: 30), // Add spacing between the buttons
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const signIn()), // Replace SignUp with the appropriate widget
                    );
                    // Handle sign in button press
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFAA77FF), // Background color
                    minimumSize: const Size(180, 60), // Button size
                  ),
                  child: const Text(
                    'Sign in',
                    style: TextStyle(fontSize: 24), // Increase font size
                  ),
                ),
                const SizedBox(height: 10), // Add spacing below the buttons
                const Padding(
                  padding: EdgeInsets.only(bottom: 120.0), // Add bottom padding
                  child: Text(
                    'Already a member?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

*/