// ignore_for_file: camel_case_types, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:mental_health/Goals/start_goal.dart';

class selfGrowth extends StatefulWidget {
  const selfGrowth({Key? key}) : super(key: key);

  @override
  _SelfGrowthState createState() => _SelfGrowthState();
}

class _SelfGrowthState extends State<selfGrowth> {
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
                  Image.asset(
                    'assets/images/selfgrowth1.png',
                    width: 500, // Adjust the width of the image
                    height: 190, // Adjust the height of the image
                  ),
                  // Texts
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        const Text(
                          'Self Growth',
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
                        const SizedBox(height: 10),
                        const Text(
                          'Every turning point in the path offers the opportunity for growth and improvement. Some ideas for you.',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFFAA77FF),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
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
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              buildButton('Read', Icons.book),
                              const SizedBox(width: 10),
                              buildButton('Learn Language', Icons.abc),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              buildButton('Set Challenges', Icons.check),
                              const SizedBox(width: 10),
                              buildButton('Grow Skill', Icons.stairs),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              buildButton('To Do List', Icons.list),
                              const SizedBox(width: 10),
                              buildButton('Triumph', Icons.celebration),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
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
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(
        onPressed: () {
          _startGoal.showFrequencyModal(context); // Call showFrequencyModal
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 195, 236, 255),
          padding: const EdgeInsets.all(24),
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
