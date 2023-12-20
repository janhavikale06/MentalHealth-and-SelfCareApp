// ignore_for_file: camel_case_types, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:mental_health/Goals/start_goal.dart';

class badhabits extends StatefulWidget {
  const badhabits({Key? key}) : super(key: key);

  @override
  _BadHabitsState createState() => _BadHabitsState();
}

class _BadHabitsState extends State<badhabits> {
  int counter = 0;
  final StartGoal _startGoal = const StartGoal();

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
                    'assets/images/badhabits1.png',
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
                          'Break Bad Habits',
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
                          'Determine what is limiting your behavior, redirect your attention, and take control of your actions again.',
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
                              buildButton('No Smoking', Icons.smoking_rooms),
                              const SizedBox(width: 10),
                              buildButton('No Alcohol', Icons.no_drinks),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              buildButton('Limit TV', Icons.tv),
                              const SizedBox(width: 10),
                              buildButton('No Late Nights', Icons.night_shelter),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              buildButton('Be Productive', Icons.work),
                              const SizedBox(width: 10),
                              buildButton('Limit Social Media', Icons.app_blocking),
                              
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
            padding: const EdgeInsets.all(22.5),
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
