import 'package:flutter/material.dart';
import 'package:upliftu/exercise/exercise_video.dart';

class MeditationScreen extends StatelessWidget {
  const MeditationScreen({Key? key}) : super(key: key);

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF97DEFF),
        title: const Text(
          'Meditation Sessions',
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
                  padding: const EdgeInsets.only(top: 0, bottom:15),
                  child: Container(
                    width: double.infinity,
                    height: 167,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/meditation_home1.png'),
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
                          builder: (context) => const VideoPlayerScreen(videoId: 'DulNz2CkoHI'), // Replace with your YouTube video ID
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
                          'assets/images/medi1.png', // Replace with your image path
                          height: 80,
                          width: 110,
                        ),
                        const SizedBox(width: 18),
                        // 2nd Column - Texts
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '10 Minutes \nMeditation',
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
                          builder: (context) => const VideoPlayerScreen(videoId: 'O-6f5wQXSu8'), // Replace with your YouTube video ID
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
                          'assets/images/medi2.png', // Replace with your image path
                          height: 80,
                          width: 110,
                        ),
                        const SizedBox(width: 18),
                        // 2nd Column - Texts
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Meditation For \nAnxiety',
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
                          builder: (context) => const VideoPlayerScreen(videoId: '1dbYduxIpwE'), // Replace with your YouTube video ID
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
                          'assets/images/medi3.png', // Replace with your image path
                          height: 80,
                          width: 110,
                        ),
                        const SizedBox(width: 18),
                        // 2nd Column - Texts
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Guided Relaxation\nfor Stress',
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
                          builder: (context) => const VideoPlayerScreen(videoId: 'LiUnFJ8P4gM'), // Replace with your YouTube video ID
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
                          'assets/images/medi4.png', // Replace with your image path
                          height: 80,
                          width: 110,
                        ),
                        const SizedBox(width: 18),
                        // 2nd Column - Texts
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '10 Minutes Calm \nBreathing Exercise',
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