// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:upliftu/Goals/creategoal.dart';
import 'package:upliftu/habit_tracker/habit_tracker.dart';
import 'package:upliftu/mood_tracker/mood_tracker.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//import 'package:mental_health/social_tracker.dart';

class TrackerPage extends StatefulWidget {
  const TrackerPage({Key? key}) : super(key: key);

  @override
  _TrackerPageState createState() => _TrackerPageState();

}

class _TrackerPageState extends State<TrackerPage> {
  //late SharedPreferences _prefs;
  //String _selectedFrequency = '';
  List<String> selectedOptions = ['Jogging']; // Define selectedOptions

  @override
  void initState() {
    super.initState();
    _initPrefs();
  }

  Future<void> _initPrefs() async {
    //_prefs = await SharedPreferences.getInstance();
    _loadSelectedFrequency();
  }

  Future<void> _loadSelectedFrequency() async {
    //final selectedFrequency = _prefs.getString('selectedFrequency') ?? '';
    setState(() {
      //_selectedFrequency = selectedFrequency;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/home_image.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 100),
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 195, 236, 255),
                    border: Border.all(color: const Color(0xFF97DEFF), width: 2),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        "Create New Goal",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFAA77FF),
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
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Time to take on a challenge and elevate your life.",
                        style: TextStyle(fontSize: 19, color: Color(0xFFAA77FF)),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const CreateGoal()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFAA77FF),
                          minimumSize: const Size(100, 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        child: const Text(
                          'Create',
                          style: TextStyle(fontSize: 22, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //const SizedBox(height: 25),
              /*
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 195, 236, 255),
                    border: Border.all(color: const Color(0xFFD8B4F8), width: 2),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "       Selected Goal: Get Fit",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFAA77FF),
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "                      Date: 2023-12-31",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFFAA77FF),
                        ),
                      ),
                      SizedBox(height: 10),
                      Wrap(
                        spacing: 10.0,
                        runSpacing: 5.0,
                        children: [
                          Row(
                            children: [
                              Chip(
                                label: Text(
                                  'Jogging',
                                  style: TextStyle(color: Colors.white, fontSize: 16),
                                ),
                                backgroundColor: Color(0xFFD8B4F8),
                              ),
                              SizedBox(width: 10), // Add some space between the Chip and Text
                              Text(
                                "Do Jogging 3 days per week",
                                style: TextStyle(fontSize: 16, color: Color(0xFFAA77FF)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ), */
                
              const SizedBox(height: 40),
              const Text(
                "Trackers",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFAA77FF),
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
                ),
              ),
              const SizedBox(height: 17),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TrackerColumn(
                    imagePath: 'assets/images/moodtracker1.png',
                    trackerName: 'Mood Tracker',
                    height: 125,
                    width: 150,
                    imagePadding: const EdgeInsets.only(left: 15, right:30),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MoodTrackerPage(moodData: {},)),
                      );
                    },
                  ),
                  TrackerColumn(
                    imagePath: 'assets/images/habitracker1.png',
                    trackerName: 'Habit Tracker',
                    height: 125,
                    width: 150,
                    imagePadding: const EdgeInsets.only(left: 10, right: 15),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HabitTrackerPage(updateHabits: (List<Habit> updatedHabits) {})),
                      );
                    },
                  ),
                ],
              ),
              /*Center(
                child: TrackerColumn(
                  imagePath: 'assets/images/socialMtracker1.png',
                  trackerName: 'Social Media Apps Tracker',
                  height: 106,
                  width: 190,
                  imagePadding: const EdgeInsets.only(top: 10, bottom: 3),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SocialMediaTrackerPage()),
                    );
                  },
                ),
              ),*/
            ],
          ),
        ],
      ),
    );
  }
}

class TrackerColumn extends StatelessWidget {
  final String imagePath;
  final String trackerName;
  final double height;
  final double width;
  final EdgeInsetsGeometry imagePadding;
  final VoidCallback onPressed;

  const TrackerColumn({
    Key? key,
    required this.imagePath,
    required this.trackerName,
    required this.height,
    required this.width,
    required this.imagePadding,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: imagePadding,
          child: Image.asset(imagePath, height: height, width: width),
        ),
        ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFAA77FF),
            minimumSize: const Size(70, 36),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7),
              side: const BorderSide(color: Color(0xFFAA77FF), width: 2),
            ),
          ),
          child: Text(
            trackerName,
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
