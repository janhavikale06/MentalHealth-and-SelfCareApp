// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:mental_health/habit_tracker/habit_tracker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:mental_health/survey/know_more_page.dart';
//import 'package:fl_chart/fl_chart.dart';

class ProfilePage extends StatefulWidget {
  final List<List<Habit>> habitsData;

  const ProfilePage({Key? key, required this.habitsData}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late SharedPreferences prefs;
  int selectedPhotoIndex = 0;
  Map<DateTime, String> selectedDayMoodData = {};

  DateTime selectedDate = DateTime(2023, 12, 5);

  List<String> profilePhotos = [
    'assets/images/profile1.png',
    'assets/images/profile2.png',
    'assets/images/profile3.png',
    'assets/images/profile4.png',
    'assets/images/profile5.png',
    'assets/images/profile6.png',
    'assets/images/profile7.png',
    'assets/images/profile8.png',
  ];

  Future<void> _showImageSelectionDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Profile Photo'),
          content: SingleChildScrollView(
            child: ListBody(
              children: profilePhotos.asMap().entries.map((entry) {
                final index = entry.key;
                final imagePath = entry.value;
                return ListTile(
                  title: Image.asset(
                    imagePath,
                    width: 50,
                    height: 50,
                  ),
                  onTap: () {
                    setState(() {
                      selectedPhotoIndex = index;
                    });
                    Navigator.of(context).pop();
                  },
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final userProfile = context.watch<UserProfileProvider>().userProfile;

    if (userProfile == null) {
      return const Scaffold(
        body: Center(
          child: Text('User data not available'),
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/home_image.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 65.0, 0, 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _showImageSelectionDialog(context);
                      },
                      child: CircleAvatar(
                        radius: 75,
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage(profilePhotos[selectedPhotoIndex]),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Name: ${userProfile.name}', style: const TextStyle(fontSize: 17, color: Color(0xFFAA77FF))),
                          Text('Age: ${userProfile.age}', style: const TextStyle(fontSize: 17, color: Color(0xFFAA77FF))),
                          Text('Gender: ${userProfile.gender}', style: const TextStyle(fontSize: 17, color: Color(0xFFAA77FF))),
                          Text('Location: ${userProfile.location}', style: const TextStyle(fontSize: 17, color: Color(0xFFAA77FF))),
                          Text('Work Status: ${userProfile.workStatus}', style: const TextStyle(fontSize: 17, color: Color(0xFFAA77FF))),
                          Text('Marital Status: ${userProfile.maritalStatus}', style: const TextStyle(fontSize: 17, color: Color(0xFFAA77FF))),
                          Text('Goals: ${userProfile.goals}', style: const TextStyle(fontSize: 17, color: Color(0xFFAA77FF))),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              FutureBuilder(
                future: getSurveyData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    // Fetch survey data from SharedPreferences
                    String selfCareAttitude = prefs.getString('selfCareAttitude') ?? '';
                    String newPeoplePreference = prefs.getString('newPeoplePreference') ?? '';
                    String spareTimeActivity = prefs.getString('spareTimeActivity') ?? '';
                    String typicalSchedule = prefs.getString('typicalSchedule') ?? '';
                    String socialGatheringPreference = prefs.getString('socialGatheringPreference') ?? '';
                    String selfCareActivity = prefs.getString('selfCareActivity') ?? '';

                    return SingleChildScrollView(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.all(15.0),
                            padding: const EdgeInsets.all(15.0),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 195, 236, 255),
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(color: const Color(0xFF97DEFF), width: 2),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Personality : $selfCareAttitude', style: const TextStyle(fontSize: 16, color: Color(0xFFAA77FF))),
                                Text('Social Preference : $newPeoplePreference', style: const TextStyle(fontSize: 16, color: Color(0xFFAA77FF))),
                                Text('Spare Time Activity : $spareTimeActivity', style: const TextStyle(fontSize: 16, color: Color(0xFFAA77FF))),
                                Text('Typical Schedule : $typicalSchedule', style: const TextStyle(fontSize: 16, color: Color(0xFFAA77FF))),
                                Text('Social Gathering Preference : $socialGatheringPreference', style: const TextStyle(fontSize: 16, color: Color(0xFFAA77FF))),
                                Text('Stressed Time Activity : $selfCareActivity', style: const TextStyle(fontSize: 16, color: Color(0xFFAA77FF))),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> getSurveyData() async {
    prefs = await SharedPreferences.getInstance();
    // Fetch saved survey data from SharedPreferences
    // You can use this method to retrieve the data if needed immediately on page load
  }

  bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year && date1.month == date2.month && date1.day == date2.day;
  }
}



/* import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final List<List<Habit>> habitsData;

  const ProfilePage({Key? key, required this.habitsData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Habits Data:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: habitsData.length,
              itemBuilder: (context, dayIndex) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Day ${dayIndex + 1}',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: habitsData[dayIndex].length,
                          itemBuilder: (context, habitIndex) {
                            final habit = habitsData[dayIndex][habitIndex];
                            return ListTile(
                              title: Text(habit.name),
                              subtitle: Text('Is Done: ${habit.isDone}'),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
 */