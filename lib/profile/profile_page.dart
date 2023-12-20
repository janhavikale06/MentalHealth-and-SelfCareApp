// ignore_for_file: library_private_types_in_public_api, deprecated_member_use, avoid_print

import 'package:flutter/material.dart';
import 'package:mental_health/habit_tracker/habit_tracker.dart';
import 'package:mental_health/profile/personal_details.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:mental_health/survey/know_more_page.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:fl_chart/fl_chart.dart';

class ProfilePage extends StatefulWidget {
  final List<List<Habit>> habitsData;

  const ProfilePage({Key? key, required this.habitsData}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late SharedPreferences prefs;
  //int selectedPhotoIndex = 0;
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
    initProfileData();
  }

  Future<void> initProfileData() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedImagePath = prefs.getString('profilePhotoPath') ?? '';
      // Add more data retrieval here if needed
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
        profilePhotoPath: selectedImagePath, // Pass the saved profile photo path
      ),
    ),
  );
}

  void _showDrawer(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: const Color(0xFF97DEFF), //Color.fromARGB(255, 230, 211, 248),
          height: MediaQuery.of(context).size.height * 0.18,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListTile(
                title: const Text(
                  'Personal Details' ,
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
                title: const Text('Log Out' ,
                style: TextStyle(
                  color: Color(0xFFAA77FF),
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  //logoutUser(); // Clear user data
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
                        ? const Icon(Icons.add) // Show "+" icon for the last item
                        : Image.asset(
                            imagePath,
                            width: 50,
                            height: 50,
                          ),
                    onTap: () {
                      if (index == profilePhotos.length - 1) {
                        // User tapped on the "+" icon, call the method to pick image from gallery
                        _getImageFromGallery();
                      } else {
                        _saveProfilePhoto(imagePath); // Save selected profile photo path
                        setState(() {
                          // Remove this line: selectedPhotoIndex = index;
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
  
    // Request permission to access the gallery
    final PickedFile? pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      // Handle the selected image
      _saveProfilePhoto(pickedFile.path); // Save selected profile photo path
      setState(() {
        // Save the image path to your model
        //selectedPhotoIndex = -1; // To indicate that the user selected an image from the gallery
        selectedImagePath = pickedFile.path;
      });
    } else {
      // User canceled the image picking
      // You may want to show a message or handle it accordingly
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
            icon: const Icon(Icons.menu), // This is the icon of three lines
            onPressed: () {
              _showDrawer(context); // This function will display the drawer
            },
          ),
        ],
      ),
      body: 
      Stack(
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
              Center(
                child: Padding(
                padding: const EdgeInsets.fromLTRB(25.0, 20.0, 0, 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _showImageSelectionDialog(context);
                      },
                      child: CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.transparent,
                        backgroundImage: selectedImagePath.isNotEmpty
                        ? AssetImage(selectedImagePath)
                        : const AssetImage('assets/images/profile4.png'), // Use a default image if none is selected
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
                                  fontSize: 25,
                                  color: Color(0xFFAA77FF),
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
              
              const SizedBox(height: 15),
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
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoChip(String label, String value) {
    return Chip(
      label: Padding(
        padding: const EdgeInsets.all(2.0), // Add padding to the inside of the box
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 12, color: Color(0xFFAA77FF), fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4), // Add space between label and value
            Text(
              value,
              style: const TextStyle(fontSize: 10, color: Color(0xFFAA77FF)),
            ),
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 195, 236, 255),
      labelStyle: const TextStyle(color: Color(0xFFAA77FF)),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22.0), // Add border radius
        side: const BorderSide(color: Color(0xFF97DEFF), width: 2), // Add border color and width
      ),
    );
  }



  bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year && date1.month == date2.month && date1.day == date2.day;
  }
}
