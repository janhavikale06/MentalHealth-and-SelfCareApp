import 'package:flutter/material.dart';
import 'package:mental_health/art_therapy/art_therapy.dart';
import 'package:mental_health/exercise/exercise_screen.dart';
import 'package:mental_health/journal/journaling_screen.dart';
import 'package:mental_health/meditation/meditation_screen.dart';
import 'package:mental_health/music_screen.dart';
import 'package:mental_health/open_share_circle.dart';

class MentalHealthPage extends StatelessWidget {
  final PageController _pageController = PageController(initialPage: 0);

  MentalHealthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _buildBackgroundImage(),
          SingleChildScrollView(
            child: _buildContent(context),
          ),
        ],
      ),
    );
  }

  Widget _buildBackgroundImage() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/home_image.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
  return Align(
    alignment: Alignment.topLeft,
    child: Padding(
      padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildTitle(),
          _buildFeatureCards(context),
          _buildPageNavigation(),
          const SizedBox(height: 20),
          _buildTodayActivity(),
          _buildActivityCard(
            title: 'Open Sharing Circle',
            description: 'Discover the impact of open dialogue among    \nindividuals facing similar challenges.',
            context: context,
          ),
          const SizedBox(height: 10),
          _buildActivityCard(
            title: 'Art Therapy',
            description: 'Self-expression and healing through art can be \nachieved through art.',
            context: context,
          ),
        ],
      ),
    ),
  );
}

Widget _buildActivityCard({required String title, required String description, required BuildContext context}) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Container(
      decoration: BoxDecoration(
        color: const Color(0xFF97DEFF),
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 5.0,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
              color: Color(0xFFAA77FF),
            ),
          ),
          const SizedBox(height: 10.0),
          Text(
            description,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10.0),
          ElevatedButton(
            onPressed: () {
              if (title == 'Art Therapy') {
                // Navigate to Art Therapy page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ArtTherapyPage(), // Replace with your Art Therapy page
                  ),
                );
              } else if (title == 'Open Sharing Circle') {
                  // Navigate to the next page after clicking "Join Now" for "Open Sharing Circle"
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OpenSharedCircle(), // Replace with your next page
                    ),
                  );
                } else {
                // Handle other activities
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFAA77FF),
              elevation: 0,
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
  );
}
 
  Widget _buildTitle() {
    return const Text(
      'Features For You',
      style: TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
        shadows: [
          Shadow(
            color: Colors.white, 
            offset: Offset(-1, -1), 
            blurRadius: 5,
          ),
          Shadow(
            color: Color(0xFF97DEFF),
            offset: Offset(1, 1),
            blurRadius: 5,
          ),
        ],
        color: Color(0xFFAA77FF),
      ),
    );
  }

  Widget _buildFeatureCards(BuildContext context) {
    return SizedBox(
      height: 220,
      child: PageView.builder(
        controller: _pageController,
        itemCount: 4,
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
              _handleFeatureCardPressed(context, index);
            },
          );
        },
      ),
    );
  }

  Widget _buildPageNavigation() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            _navigatePage(-1);
          },
          icon: const Icon(Icons.arrow_left),
        ),
        IconButton(
          onPressed: () {
            _navigatePage(1);
          },
          icon: const Icon(Icons.arrow_right),
        ),
      ],
    );
  }

  Widget _buildTodayActivity() {
    return const Text(
      'Today\'s Activity',
      style: TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
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
    );
  }


  void _handleFeatureCardPressed(BuildContext context, int index) {
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
  }

  void _navigatePage(int pageOffset) {
  final nextPage = _pageController.page! + pageOffset;
  if (nextPage >= 0 && nextPage <= 3) {
    _pageController.animateToPage(
      nextPage.toInt(),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
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
      margin: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: onPressed,
        child: Column(
          children: <Widget>[
            Expanded(
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
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFAA77FF),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
