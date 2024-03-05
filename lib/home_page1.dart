// ignore_for_file: unnecessary_string_interpolations, camel_case_types, library_private_types_in_public_api

import 'package:flutter/material.dart';
//import 'package:upliftu/survey/know_more_page.dart';
import 'package:upliftu/profile/profile_page.dart';
import 'package:upliftu/tracker_page.dart';
import 'package:upliftu/selfcare_page.dart';
import 'package:upliftu/mental_health_pages/mentalhealth_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:upliftu/survey/user_survey.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<homePage> {
  String userName = 'User';
  String motivationalQuote = "";
  List<String> positiveImages = [
    'assets/images/quote2.png',
    'assets/images/quote3.png',
    //'assets/images/moodtracker3.png',
    'assets/images/quote4.png',
    'assets/images/quote6.png',
    'assets/images/habittracker2.png',
    //'assets/images/habittracker4.png',
    'assets/images/sleeptracker1.png',
  ];

  @override
  void initState() {
    super.initState();
    getFullName();
    fetchRandomQuote();
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

  Future<void> fetchRandomQuote() async {
    final response =
        await http.get(Uri.parse('https://api.quotable.io/random'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final String content = data['content'];
      final String author = data['author'];
      setState(() {
        motivationalQuote = '"$content" - $author';
      });
    } else {
      setState(() {
        motivationalQuote =
            "Stay positive and good things will happen."; // Default quote
      });
    }
  }

  int _currentIndex = 0;

Widget buildHomePage() {
  return Scaffold(
    body: Stack(
      children: [
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
                padding: const EdgeInsets.only(left:20, right: 20, top: 40),
                child: Container(
                  width: double.infinity,
                  height: 325,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/home_page1.png'),
                      fit: BoxFit.cover,
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
                    text: '$userName!',
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
          const SizedBox(height: 10),
          Center(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color.fromARGB(255, 173, 142, 213), // Purple color
                    Color.fromARGB(255, 118, 40, 213), // Darker purple color
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                motivationalQuote,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white, // Change to your desired text color
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
          Center(
            child: Column(
              children: [
                const Text(
                  'Let\'s get to know more about you',
                  style: TextStyle(fontSize: 22, color: Color(0xFFAA77FF)),
                ),
                const SizedBox(height: 4),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UserSurvey()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFAA77FF),
                    minimumSize: const Size(70, 36),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                      side: const BorderSide(color: Color(0xFFAA77FF), width: 2),
                    ),
                  ),
                  child: const Text(
                    'Start',
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 370,
                height: 1,
                color: const Color(0xFFAA77FF),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Center(
            child: Column(
              children: [
                const Text(
                  'Scroll for some positive vibes',
                  style: TextStyle(fontSize: 25, color: Color(0xFFAA77FF) , fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(left: 0, right: 0),
                  child: Wrap(
                  spacing: 10,
                  runSpacing: 15,
                  alignment: WrapAlignment.center,
                  children: positiveImages
                  .map(
                    (assetPath) => Container(
                      width: MediaQuery.of(context).size.width / 2 - 14,
                      height: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(assetPath), // Use AssetImage here
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )
                  .toList(),
                ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    ),
    ],
  ));
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

    return Scaffold(
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
    );
  }
}
