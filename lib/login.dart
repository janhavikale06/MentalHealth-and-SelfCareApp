import 'package:flutter/material.dart';
import 'package:mental_health/sign_up.dart';
import 'package:mental_health/sign_in.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    const String login = 'assets/images/login_image.jpg';

    return Scaffold(
      backgroundColor: const Color(0xFFD8B4F8),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40.0, 55.0, 40.0, 0), // Add top padding
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              // This Container will serve as the background with the specified color
              color: const Color(0xFFD8B4F8),
            ),
            Image.asset(
              login,
              width: 400,
              height: 500,
              fit: BoxFit.cover, // Cover the available space
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
                    minimumSize: const Size(200, 50), // Button size
                  ),
                  child: const Text(
                    'Sign up',
                    style: TextStyle(fontSize: 20), // Increase font size
                  ),
                ),
                const SizedBox(height: 20), // Add spacing between the buttons
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
                    minimumSize: const Size(200, 50), // Button size
                  ),
                  child: const Text(
                    'Sign in',
                    style: TextStyle(fontSize: 20), // Increase font size
                  ),
                ),
                const SizedBox(height: 10), // Add spacing below the buttons
                const Padding(
                  padding: EdgeInsets.only(bottom: 65.0), // Add bottom padding
                  child: Text(
                    'Already a member?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
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
