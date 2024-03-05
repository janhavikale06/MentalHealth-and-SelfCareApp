/*


// ignore_for_file: unnecessary_string_interpolations, camel_case_types, library_private_types_in_public_api
import 'package:flutter/material.dart';
//import 'package:upliftu/survey/know_more_page.dart';
import 'package:upliftu/profile/profile_page.dart';
import 'package:upliftu/tracker_page.dart';
import 'package:upliftu/selfcare_page.dart';
import 'package:upliftu/mentalhealth_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upliftu/user_survey.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<homePage> {
   String userName = 'User';

  @override
  void initState() {
    super.initState();
    getFullName();
  }

  Future<void> getFullName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? fullName = prefs.getString('fullName');
    if (fullName != null) {
      setState(() {
        userName = fullName;
      });
    }
  }
  
  int _currentIndex = 0;
 // RangeValues _moodRange = const RangeValues(0, 100); // Initial mood range values

  Widget buildHomePage() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 26),
              child: Container(
                width: 280,
                height: 260,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/home_page1.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 20),
            child: RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'Hello, ',
                    style: TextStyle(
                      fontSize: 38,
                      color: Color(0xFFAA77FF),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: '$userName !',
                    style: const TextStyle(
                      fontSize: 38,
                      color: Color(0xFFAA77FF),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
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
          /*
          const SizedBox(height: 50),
          Center(
            child: Container(
              width: 200,
              height: 90,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/home_page2.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 88, right: 85),
              child: RangeSlider(
                values: _moodRange,
                onChanged: (RangeValues values) {
                  setState(() {
                    _moodRange = values;
                  });
                },
                min: 0,
                max: 100,
                divisions: 100,
                labels: RangeLabels(
                  '${_moodRange.start.toStringAsFixed(0)}',
                  '${_moodRange.end.toStringAsFixed(0)}',
                ),
                activeColor: const Color(0xFFAA77FF),
              ),
            ),
          ),
          */
          const SizedBox(height: 50),
          Center(
            child: Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Column(
              children: [
                const Text(
                  'Let\'s get to know more about you',
                  style: TextStyle(fontSize: 21, color: Color(0xFFAA77FF)),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const UserSurvey()),
                    );
                  },
                   style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFAA77FF),
                    minimumSize: const Size(70, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                      side: const BorderSide(color: Color(0xFFAA77FF), width: 2),
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

          ),
          
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget selectedPage;

    switch (_currentIndex) {
      case 0:
        selectedPage = buildHomePage();
        break;
      case 1:
        selectedPage = const TrackerPage();
        break;
      case 2:
        selectedPage = const SelfCarePage();
        break;
      case 3:
        selectedPage = MentalHealthPage();
        break;
      case 4:
        selectedPage = const ProfilePage(habitsData: []);
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
        body: selectedPage,
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


*/