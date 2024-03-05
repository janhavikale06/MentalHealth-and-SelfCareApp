// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:upliftu/Goals/start_goal.dart';

class LiveHealthier extends StatefulWidget {
  const LiveHealthier({Key? key}) : super(key: key);

  @override
  _LiveHealthierState createState() => _LiveHealthierState();
}

class _LiveHealthierState extends State<LiveHealthier> {
  final StartGoal _startGoal = const StartGoal();
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFD8B4F8),
        title: const Text(
          'Goals',
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Background Image
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/home_image.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  // Additional Image on Top
                  Image.asset(
                    'assets/images/livehealth1.png',
                    width: 600, // Adjust the width of the image
                    height: 200, // Adjust the height of the image
                  ),
                  const SizedBox(height: 15),
                  // Rest of your content
                  const Text(
                    'Live Healthier',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                      shadows: [
                        Shadow(
                          color: Color(0xFF97DEFF),
                          offset: Offset(-1, -1),
                          blurRadius: 5,
                        ),
                        Shadow(
                          color: Colors.white,
                          offset: Offset(1, 1),
                          blurRadius: 5,
                        ),
                      ],
                      color: Color(0xFFAA77FF),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        const Text(
                          'Set out on your path to a better lifestyle now. Select an easy routine that can improve your day.',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFFAA77FF),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        // Custom Line Break
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: 360,
                              height: 1,
                              color: const Color(0xFFAA77FF),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        // Text Below the Line Break
                        const Text(
                          'Pick From Our Suggestions',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFAA77FF),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 7),
                  // Buttons and Texts
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buildButton('No Soda', Icons.local_cafe_outlined),
                            const SizedBox(width: 10),
                            buildButton('No Fast Food', Icons.local_pizza),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buildButton('No Sweets', Icons.cake),
                            const SizedBox(width: 10),
                            buildButton('No Night Snacks', Icons.fastfood),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buildButton('Drink Water', Icons.local_drink),
                            const SizedBox(width: 10),
                            buildButton('Eat Fruits', Icons.local_grocery_store_outlined),
                          ],
                        ),
                      ),
                      const SizedBox(height: 150),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
 Widget buildButton(String text, IconData icon) {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
            _startGoal.showFrequencyModal(context); // Call showFrequencyModal
          },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 195, 236, 255),
          padding: const EdgeInsets.all(23),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: const Color.fromARGB(255, 210, 183, 254),
              size: 30,
            ),
            const SizedBox(height: 15),
            Text(
              text,
              style: const TextStyle(
                color: Color(0xFFAA77FF),
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

}
