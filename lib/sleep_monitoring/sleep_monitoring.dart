// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:mental_health/sleep_monitoring/sleeptrackingpart.dart';

class SleepMonitoringPage extends StatefulWidget {
  const SleepMonitoringPage({Key? key}) : super(key: key);

  @override
  _SleepMonitoringPageState createState() => _SleepMonitoringPageState();
}

class _SleepMonitoringPageState extends State<SleepMonitoringPage> {
  double sleepQualityPercentage = 75; // Set your initial sleep quality percentage here
  int hours = 7;
  int minutes = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF97DEFF),
        title: const Text(
          'Sleep Monitoring',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/home_image.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, right: 15, left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Add an image at the top
                Positioned(
                  top: 0,
                  child: Container(
                    margin: const EdgeInsets.only(bottom:25.0),
                    child: Image.asset(
                      'assets/images/sleephome.png',
                      width: 480, // Set desired width
                      height: 210, // Set desired height
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  height: 175,
                  width: 348,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 5.0,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Monday',
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFAA77FF),
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              'Sleep time: 10:30 to 7:00 AM',
                              style: TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(255, 211, 169, 248),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 22.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                // Add your image here
                                Image.asset(
                                  'assets/images/sleep.png',
                                  height: 55,
                                  width: 65,
                                ),
                              ],
                            ),
                            const SizedBox(width: 20.0),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 40.0),
                              child: Column(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const StartTrackingButton()),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFFAA77FF),
                                      elevation: 0,
                                      fixedSize: const Size(150, 30), // Set desired width and height
                                    ),
                                    child: const Text(
                                      'Start Tracking',
                                      style: TextStyle(fontSize: 18), // Set desired font size
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40.0),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Statistics',
                      style: TextStyle(
                        fontSize: 30,
                        shadows: [
                          Shadow(
                            color: Color.fromARGB(255, 181, 226, 247),
                            offset: Offset(-1, -1),
                            blurRadius: 5,
                          ),
                        ],
                        color: Color(0xFFAA77FF),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 140,
                      width: 160,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 181, 232, 255),
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFFD0BFFF).withOpacity(1),
                            blurRadius: 5.0,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(right: 18.0),
                              child: Text(
                                'Quality',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFAA77FF),
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Padding(
                              padding: const EdgeInsets.only(right: 28.0),
                              child: Text(
                                '$sleepQualityPercentage%',
                                style: const TextStyle(
                                  fontSize: 23,
                                  color: Color(0xFFAA77FF),
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Container(
                                height: 10,
                                width: 160 * (sleepQualityPercentage / 100),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFD0BFFF),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Container(
                      height: 140,
                      width: 160,
                      decoration: BoxDecoration(
                        color: const Color(0xFFD0BFFF),
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 181, 232, 255).withOpacity(0.4),
                            blurRadius: 5.0,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Duration',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFAA77FF),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Padding(
                              padding: const EdgeInsets.only(left: 22.0),
                              child: Text(
                                '$hours hr $minutes min',
                                style: const TextStyle(
                                  fontSize: 23,
                                  color: Color(0xFFAA77FF),
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Container(
                                height: 10,
                                width: 160 * (sleepQualityPercentage / 100),
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 181, 232, 255),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                          ],
                        ),
                      ),
                      // Additional statistics widget content goes here for the second rectangle
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
