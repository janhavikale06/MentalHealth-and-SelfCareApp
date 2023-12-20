// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:mental_health/exercise/exercise_video.dart';

class ExerciseScreen extends StatefulWidget {
  const ExerciseScreen({Key? key}) : super(key: key);

  @override
  _ExerciseScreenState createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  // Function to navigate to the video screen

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF97DEFF),
        title: const Text(
          'Exercise Sessions',
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          // Your background image or content
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/home_image.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 0, bottom:20),
                  child: Container(
                    width: double.infinity,
                    height: 150,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/exercise_home.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 18, right: 18),
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate directly to the YouTube video screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const VideoPlayerScreen(videoId: 'agvdkRc_img'), // Replace with your YouTube video ID
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.all(20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Row(
                      children: [
                        // 1st Column - Image
                        Image.asset(
                          'assets/images/fullbodywk.png', // Replace with your image path
                          height: 80,
                          width: 110,
                        ),
                        const SizedBox(width: 18),
                        // 1st Column - Texts
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '10 Minutes Full \nBody Workout',
                              style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFAA77FF),
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'See Details',
                              style: TextStyle(
                                fontSize: 15,
                                color: Color(0xFFD8B4F8),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(left: 18, right: 18),
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate directly to the YouTube video screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const VideoPlayerScreen(videoId: 'haRSl3mThoY'), // Replace with your YouTube video ID
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.all(20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Row(
                      children: [
                        
                        Image.asset(
                          'assets/images/brainex.png', // Replace with your image path
                          height: 80,
                          width: 110,
                        ),
                        const SizedBox(width: 18),
                        // 2nd Column - Texts
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '6 Brain Exercises',
                              style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFAA77FF),
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'See Details',
                              style: TextStyle(
                                fontSize: 15,
                                color: Color(0xFFD8B4F8),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(left: 18, right: 18),
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate directly to the YouTube video screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const VideoPlayerScreen(videoId: 'Eml2xnoLpYE'), // Replace with your YouTube video ID
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.all(20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Row(
                      children: [
                        
                        Image.asset(
                          'assets/images/fullbodyyoga.png', // Replace with your image path
                          height: 80,
                          width: 110,
                        ),
                        const SizedBox(width: 18),
                        // 3rd Column - Texts
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '25 Minutes Yoga\nExercises',
                              style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFAA77FF),
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'See Details',
                              style: TextStyle(
                                fontSize: 15,
                                color: Color(0xFFD8B4F8),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(left: 18, right: 18),
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate directly to the YouTube video screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const VideoPlayerScreen(videoId: 'MjMkBaqimFo'), // Replace with your YouTube video ID
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.all(20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Row(
                      children: [
                        
                        Image.asset(
                          'assets/images/emobenefits.png', // Replace with your image path
                          height: 80,
                          width: 110,
                        ),
                        const SizedBox(width: 18),
                        // 4th Column - Texts
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Emotional Benefits \nof Exercise',
                              style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFAA77FF),
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'See Details',
                              style: TextStyle(
                                fontSize: 15,
                                color: Color(0xFFD8B4F8),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),      
                const SizedBox(height: 10),       
                ],
            ),
          ),
        ],
      ),
    );
  }
}