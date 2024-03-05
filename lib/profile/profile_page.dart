// ignore_for_file: library_private_types_in_public_api, deprecated_member_use, avoid_print, prefer_typing_uninitialized_variables

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:upliftu/habit_tracker/habit_tracker.dart';
import 'package:upliftu/profile/personal_details.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:upliftu/survey/know_more_page.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  final List<List<Habit>> habitsData;

  const ProfilePage({Key? key, required this.habitsData}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Future<void> prefsFuture;
  late SharedPreferences prefs;
  Map<DateTime, String> selectedDayMoodData = {};
  late final UserProfile userProfile;
  String selectedImagePath = ''; // Store the selected image path
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

  @override
  void initState() {
    super.initState();
    prefsFuture = initProfileData();
  }

  Future<void> initProfileData() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedImagePath = prefs.getString('profilePhotoPath') ?? '';
    });
  }

  void navigateToLogin(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      '/login', // Replace '/login' with your login screen route
      (Route<dynamic> route) => false, // This clears all routes in the stack
    );
  }

  Future<void> _saveProfilePhoto(String imagePath) async {
    prefs = await SharedPreferences.getInstance();
    await prefs.setString('profilePhotoPath', imagePath);
    setState(() {
      selectedImagePath = imagePath;
    });
  }

  void navigateToPersonalDetails(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PersonalDetailsPage(
          userProfile: userProfile,
          profilePhotoPath: selectedImagePath, selectedOptions: const [], questions: const [],
        ),
      ),
    );
  }

  void _showDrawer(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: const Color(0xFF97DEFF),
          height: MediaQuery.of(context).size.height * 0.18,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListTile(
                title: const Text(
                  'Personal Details',
                  style: TextStyle(
                    color: Color(0xFFAA77FF),
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context); // Close the drawer
                  Navigator.pushNamed(context, '/personal_details');
                },
              ),
              ListTile(
                title: const Text(
                  'Log Out',
                  style: TextStyle(
                    color: Color(0xFFAA77FF),
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context); // Close the drawer
                  navigateToLogin(context); // Navigate to login screen
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _showImageSelectionDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Select Profile Photo',
            textAlign: TextAlign.center,
            style: TextStyle(color: Color(0xFFAA77FF), fontSize: 22),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                ...profilePhotos.asMap().entries.map((entry) {
                  final index = entry.key;
                  final imagePath = entry.value;
                  return ListTile(
                    title: index == profilePhotos.length - 1
                        ? const Icon(Icons.add)
                        : Image.asset(
                            imagePath,
                            width: 50,
                            height: 50,
                          ),
                    onTap: () {
                      if (index == profilePhotos.length - 1) {
                        _getImageFromGallery();
                      } else {
                        _saveProfilePhoto(imagePath);
                        setState(() {
                          selectedImagePath = imagePath;
                        });
                        Navigator.of(context).pop();
                      }
                    },
                  );
                }).toList(),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _getImageFromGallery() async {
    final ImagePicker picker = ImagePicker();

    final PickedFile? pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _saveProfilePhoto(pickedFile.path);
      setState(() {
        selectedImagePath = pickedFile.path;
      });
    } else {
      // User canceled the image picking
    }
  }

  Future<void> getSurveyData() async {
    try {
      prefs = await SharedPreferences.getInstance();
      selectedImagePath = prefs.getString('profilePhotoPath') ?? '';
      setState(() {});
    } catch (error) {
      print('Error fetching survey data: $error');
    }
  }

  Widget _buildInfoChip(String label, String value) {
    return Chip(
      label: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 13, color: Color(0xFFAA77FF), fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: const TextStyle(fontSize: 11.5, color: Color(0xFFAA77FF)),
            ),
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 195, 236, 255),
      labelStyle: const TextStyle(color: Color(0xFFAA77FF)),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22.0),
        side: const BorderSide(color: Color(0xFF97DEFF), width: 2),
      ),
    );
  }

  bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year && date1.month == date2.month && date1.day == date2.day;
  }

  Widget buildProfileUI() {
    final userProfile = context.watch<UserProfileProvider>().userProfile;

    if (userProfile == null) {
      return const Scaffold(
        body: Center(
          child: Text('User data not available'),
        ),
      );
    }

     return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF97DEFF),
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              _showDrawer(context);
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/images/home_image.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(25.0, 12.0, 0, 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _showImageSelectionDialog(context);
                          },
                          child: CircleAvatar(
                            radius: 65,
                            backgroundColor: Colors.transparent,
                            backgroundImage: selectedImagePath.isNotEmpty
                                ? AssetImage(selectedImagePath)
                                : const AssetImage('assets/images/profile4.png'),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 40.0),
                                child: Text(
                                  'Hello, ${userProfile.fullname}',
                                  style: const TextStyle(
                                    fontSize: 26,
                                    color: Color(0xFFAA77FF),
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
                                    fontWeight: FontWeight.bold,
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
                const SizedBox(height: 12),
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 10.0),
                        child: Wrap(
                          spacing: 5.0,
                          runSpacing: 5.0,
                          children: [
                            _buildInfoChip('Personality', prefs.getString('selfCareAttitude') ?? ''),
                            _buildInfoChip('Social preference', prefs.getString('newPeoplePreference') ?? ''),
                            _buildInfoChip('Spare time activity', prefs.getString('spareTimeActivity') ?? ''),
                            _buildInfoChip('Typical schedule', prefs.getString('typicalSchedule') ?? ''),
                            _buildInfoChip('Social gathering preference', prefs.getString('socialGatheringPreference') ?? ''),
                            _buildInfoChip('Stressed time activity', prefs.getString('selfCareActivity') ?? ''),
                          ],
                        ),
                      ),

                      const SizedBox(height:20),
                      /*Padding(
                        padding:const EdgeInsets.only(left: 10.0 , right: 10.0),
                        child: Container(
                          width: 370,
                          height: 1,
                          color: const Color(0xFFAA77FF),
                        ), 
                      ),*/
                      const SizedBox(height:20),

                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 195, 236, 255),
                                border: Border.all(color: const Color(0xFF97DEFF), width: 2),
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Mood Tracking Dashboard',
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: Color(0xFFAA77FF),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 220,
                                    child: MoodTrackingDashboard(),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 50),
                            
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 195, 236, 255),
                                border: Border.all(color: const Color(0xFF97DEFF), width: 2),
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Habit Tracking Dashboard',
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: Color(0xFFAA77FF),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 300,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: HabitTrackerTable(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height:20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: prefsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return buildProfileUI();
        } else if (snapshot.hasError) {
          // Handle the error, you may want to show a message or take appropriate action
          print('Error initializing SharedPreferences: ${snapshot.error}');
          return buildErrorUI();
        } else {
          // Show a loading indicator while initializing
          return buildLoadingUI();
        }
      },
    );
  }

  Widget buildErrorUI() {
    return const Scaffold(
      body: Center(
        child: Text('Error initializing SharedPreferences'),
      ),
    );
  }

  Widget buildLoadingUI() {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}


class MoodTrackingDashboard extends StatelessWidget {
  const MoodTrackingDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<FlSpot> moodData = [
      //Very Bad = 1, Bad = 2, Neutral = 3, Good = 4, Happy = 5
      const FlSpot(1, 3), 
      const FlSpot(2, 4),
      const FlSpot(3, 4),
      const FlSpot(4, 4),
      const FlSpot(5, 4),
      const FlSpot(6, 4),
      const FlSpot(7, 5),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0 , vertical: 10), // Outer padding
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            const SizedBox(height: 20),
            SizedBox(
              height: 180,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: SideTitles(
                      showTitles: true,
                      margin: 15,
                      getTextStyles: (context, value) => const TextStyle(
                        color: Color(0xff68737d),
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                      getTitles: (value) {
                        if (value >= 1 && value <= 6) {
                          return value.toInt().toString();
                        }
                        return '';
                      },
                    ),
                    leftTitles: SideTitles(
                      showTitles: true,
                      margin: 20,
                      getTextStyles: (context, value) => const TextStyle(
                        color: Color(0xff67727d),
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                      getTitles: (value) {
                        switch (value.toInt()) {
                          case 1:
                            return 'Very Bad';
                          case 2:
                            return 'Bad';
                          case 3:
                            return 'Neutral';
                          case 4:
                            return 'Good';
                          case 5:
                            return 'Happy';
                          default:
                            return '';
                        }
                      },
                    ),
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(
                      color: const Color(0xff37434d),
                      width: 0,
                    ),
                  ),
                  minX: 1,
                  maxX: 7,
                  minY: 1,
                  maxY: 5,
                  lineBarsData: [
                    LineChartBarData(
                      spots: moodData,
                      isCurved: true,
                      colors: [const Color(0xFFAA77FF)],
                      dotData: FlDotData(show: false),
                      belowBarData: BarAreaData(show: false),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class HabitTrackerTable extends StatelessWidget {
  final List<String> habitNames = [
    'Eat healthy',
    'Cycling',
    'Meditate',
    'Complete the to-do list',
    'Limit screen time',
  ];


  final List<List<bool>> habitsCompletionStatus = [
    [false, true, false, true, true, false, false],            // Habits' status for day 1 (Mon)
    [false, false, false, true, false, false, true],           // Habits' status for day 2 (Tues)
    [false, true, false, true, true, false, false],            // Habits' status for day 3 (Wed)
    [true, true, false, false , false, false, false],          // Habits' status for day 4 (Thurs)
    [false, false, false, false, true, false, false],          // Habits' status for day 5 (Fri)
    [false, true, true, false, false, false, false],           // Habits' status for day 6 (Sat)
    [true, false, true, false, false, false, false],           // Habits' status for day 7 (Sun)
  ];

  HabitTrackerTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          dataRowHeight: 38,
          columnSpacing: 0,
          horizontalMargin: 10,
          columns: [
            const DataColumn(
              label: Text(''),
            ),
            for (int day = 1; day <= 7; day++)
              DataColumn(
                label: Text(
                  _getDayLabel(day),
                  style: const TextStyle(
                    fontSize:18,
                    color: Color.fromARGB(255, 196, 163, 251),
                    shadows: [
                      Shadow(
                        color: Colors.white,
                        offset: Offset(-1, -1),
                        blurRadius: 2,
                      ),
                      Shadow(
                        color: Color(0xFF97DEFF),
                        offset: Offset(1, 1),
                        blurRadius: 0,
                      ),
                    ],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
            rows: List.generate(
            habitNames.length,
            (index) => DataRow(
              cells: [
                DataCell(Text(habitNames[index])),
                for (int day = 0; day < 7; day++)
                  DataCell(
                    Row(
                      children: [
                        if (habitsCompletionStatus[day][index])
                          IconButton(
                            icon: const Icon(Icons.check_circle, color: Color(0xFFAA77FF), size: 18),
                            onPressed: () {
                              print('Completed ${habitNames[index]} on ${_getDayLabel(day + 1)}');
                            },
                          )
                        else
                          IconButton(
                            icon: const Icon(Icons.close, color: Color(0xFFD8B4F8), size: 18),
                            onPressed: () {
                              print('Incomplete ${habitNames[index]} on ${_getDayLabel(day + 1)}');
                            },
                          ),
                      ],
                    ),
                  ),
              ],
            ),
          ).toList(),
        ),
      ),
    );
  }
            

  String _getDayLabel(int day) {
    const List<String> dayLabels = [' Mon ', ' Tues ', '  Wed ', '  Thurs', '   Fri', ' Sat', 'Sun '];
    return dayLabels[day - 1]; 
  }
}
