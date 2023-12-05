// ignore_for_file: unnecessary_string_interpolations
import 'package:flutter/material.dart';
import 'package:mental_health/know_more_page.dart';
import 'package:mental_health/profile_page.dart';
import 'package:mental_health/tracker_page.dart';
import 'package:mental_health/selfcare_page.dart';
import 'package:mental_health/mentalhealth_page.dart';

// ignore: camel_case_types
class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<homePage> {
  int _currentIndex = 0;
  RangeValues _moodRange = const RangeValues(0, 100); // Initial mood range values

  Widget buildHomePage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 65, top: 35), // Adjust left and top values as needed
          child: Container(
            width: 280,
            height: 260,
            decoration: const BoxDecoration(
              //color: Color(0xFFD8B4F8),
              image: DecorationImage(
                image: AssetImage('assets/images/home_page1.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 18, top: 20),
          child: Text(
            'Hello, Janhavi!',
            style: TextStyle(
              fontSize: 40,
              color: Color(0xFFAA77FF),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 18, top: 4),
          child: Text(
            'How are you feeling today?',
            style: TextStyle(
              fontSize: 23,
              color: Color(0xFFAA77FF),
              fontWeight: FontWeight.w400,
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(left: 100, top: 50),
          child: Container(
            width: 200,
            height: 90,
            decoration: const BoxDecoration(
              //color: Color(0xFFD8B4F8),
              image: DecorationImage(
                image: AssetImage('assets/images/home_page2.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),

        // Add the RangeSlider below the image
        Padding(
          padding: const EdgeInsets.only(left: 90, top: 1, right: 100),
          child: RangeSlider(
            values: _moodRange,
            onChanged: (RangeValues values) {
              setState(() {
                _moodRange = values;
              });
            },
            min: 0,
            max: 100,
            divisions: 100, // Adjust the number of divisions as needed
            labels: RangeLabels(
              '${_moodRange.start.toStringAsFixed(0)}', // Display the start value
              '${_moodRange.end.toStringAsFixed(0)}', // Display the end value
            ),
            activeColor: const Color(0xFFAA77FF),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(left: 48 , top: 70), // Add left padding here
          child: Column(
            children: [
              const Text(
                'Let\'s get to know more about you',
                style: TextStyle(fontSize: 21, color: Color(0xFFAA77FF)),
              ),

            // Add some spacing
            const SizedBox(height: 10),

            // Elevated button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const KnowMorePage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFAA77FF),
                minimumSize: const Size(80, 36), // Adjust the size as needed
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                  side: const BorderSide(color: Color(0xFF97DEFF), width: 1),
                ),
              ),
              child: const Text(
                'Start',
                style: TextStyle(fontSize: 21, color: Colors.white),
              ),
            ),
          ],
        ),
      )      
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget selectedPage;

    // Determine the selected page based on _currentIndex
    switch (_currentIndex) {
      case 0:
        selectedPage = buildHomePage();
        break;
      case 1:
        selectedPage = const TrackersPage(); // Show the Trackers page
        break;
      case 2:
        selectedPage = const SelfCarePage(); // Show the Self Care page
        break;
      case 3:
        selectedPage = MentalHealthPage(); // Show the Mental Health page
        break;
      case 4:
        // You can add a ProfilePage widget here if needed
        selectedPage = const ProfilePage();
        break;
      default:
        selectedPage = buildHomePage();
    }

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/home_image.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: selectedPage, // Display the selected page
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.white,
          selectedItemColor: const Color(0xFF97DEFF),
          iconSize: 30,
          backgroundColor: const Color(0xFFAA77FF),
          selectedFontSize: 12,
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.mood),
              label: 'Trackers',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.self_improvement),
              label: 'Self Care',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.spa_outlined),
              label: 'Mental Health',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Profile',
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}