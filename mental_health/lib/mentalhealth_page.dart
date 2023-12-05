import 'package:flutter/material.dart';
import 'package:mental_health/exercise/exercise_screen.dart';
import 'package:mental_health/journal/journaling_screen.dart';
import 'package:mental_health/meditation/meditation_screen.dart';
import 'package:mental_health/music_screen.dart';

class MentalHealthPage extends StatelessWidget {
  final PageController _pageController = PageController(initialPage: 0);

  MentalHealthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/home_image.jpg'), // Replace with your image asset
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft, // Align the title to the left
            child: Padding(
              padding: const EdgeInsets.only(top: 60, left: 25, right: 25), // Add top and left padding here
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Align children to the left
                children: <Widget>[
                  const Text(
                    'Features For You', // Title
                    style: TextStyle(
                      fontSize: 30.0, // Adjust the font size 
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFAA77FF), // Set the font color
                    ),
                  ),

                  SizedBox(
                    height: 220, // Adjust the height as needed
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: 4, // Number of FeatureCard widgets
                      itemBuilder: (BuildContext context, int index) {
                        return FeatureCard(
                          title: index == 0
                              ? 'Meditation'
                              : index == 1
                                  ? 'Exercise'
                                  : index == 2
                                      ? 'Journaling'
                                      : 'Music',
                          image: index == 0
                              ? 'assets/images/meditation.png'
                              : index == 1
                                  ? 'assets/images/exercise.png'
                                  : index == 2
                                      ? 'assets/images/journaling.png'
                                      : 'assets/images/music.png',
                          onPressed: () {
                            // Handle the action for each card
                            if (index == 0) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MeditationScreen(),
                                ),
                              );
                            } else if (index == 1) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ExerciseScreen(),
                                ),
                              );
                            } else if (index == 2) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const JournalingScreen(),
                                ),
                              );
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MusicScreen(),
                                ),
                              );
                            }
                          },
                        );
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          if (_pageController.page != 0) {
                            _pageController.previousPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut);
                          }
                        },
                        icon: const Icon(Icons.arrow_left), // Add your left arrow icon
                      ),
                      IconButton(
                        onPressed: () {
                          if (_pageController.page != 3) {
                            _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut);
                          }
                        },
                        icon: const Icon(Icons.arrow_right), // Add your right arrow icon
                      ),
                    ],
                  ),

                  const SizedBox(height: 20), // Add some space between the sections

                  const Text(
                    'Today\'s Activity', // Title
                    style: TextStyle(
                      fontSize: 30.0, // Adjust the font size 
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFAA77FF), // Set the font color
                    ),
                  ),
                  // Add the rectangle window with activity information and "Join Now" button
                  Container(
                    decoration: BoxDecoration(
                      color:  const Color(0xFF97DEFF), // Background color of the rectangle
                      borderRadius: BorderRadius.circular(10.0), // Rounded corners
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 5.0,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 10.0),
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Open Sharing Circle',
                          style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFAA77FF),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        const Text(
                          'Discover the impact of open dialogue among individuals facing similar challenges.',
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        ElevatedButton(
                          onPressed: () {
                            // Handle "Join Now" button action here
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFAA77FF), // Button background color
                            elevation: 0, // Remove button elevation
                          ),
                          child: const Text(
                            'Join Now',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Add the "Art Therapy" section
                  const SizedBox(height: 10),

                  Container(
                    decoration: BoxDecoration(
                      color:  const Color(0xFF97DEFF), // Background color of the rectangle
                      borderRadius: BorderRadius.circular(10.0), // Rounded corners
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 5.0,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 6.0),
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Art Therapy',
                          style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFAA77FF),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        const Text(
                          'Expressing yourself through art can be an effective method of healing and self-expression.',
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        ElevatedButton(
                          onPressed: () {
                            // Handle "Join Now" button action here
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFAA77FF), // Button background color
                            elevation: 0, // Remove button elevation
                          ),
                          child: const Text(
                            'Join Now',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FeatureCard extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback onPressed;

  const FeatureCard({
    required this.title,
    required this.image,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10.0), // Adjust the margin as needed
      child: InkWell(
        onTap: onPressed,
        child: Column(
          children: <Widget>[
            Expanded( // Wrap the image with Expanded
              child: Image.asset(
                image,
                width: 200,
                height: 100,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(7.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 23.0,
                  fontWeight: FontWeight.bold, // Set font weight to bold
                  color: Color(0xFFAA77FF), // Set custom font color
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
