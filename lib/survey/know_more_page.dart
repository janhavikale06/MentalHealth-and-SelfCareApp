// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mental_health/survey/survey_page.dart';

class KnowMorePage extends StatefulWidget {
  const KnowMorePage({Key? key}) : super(key: key);

  @override
  _KnowMorePageState createState() => _KnowMorePageState();
}

class _KnowMorePageState extends State<KnowMorePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _profileNameController = TextEditingController();

  String? username;
  String? age;
  String? selectedGender;
  String? location;
  String? selectedWorkStatus;
  String? selectedMaritalStatus;
  String? goals;

  List<String> genderOptions = ['Male', 'Female', 'Trans'];
  List<String> workStatusOptions = ['Student', 'Employed', 'Homemaker', 'Unemployed', 'Retired'];
  List<String> maritalStatusOptions = ['Single', 'Committed','Married', 'Divorced', 'Widowed'];

  Future<void> _savePrefs() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('profileName', _profileNameController.text);
  }

  void _collectUserData() {
    // Collect user data and create a UserProfile object
    UserProfile userProfile = UserProfile(
      name: username!,
      age: age!,
      gender: selectedGender!,
      location: location!,
      workStatus: selectedWorkStatus!,
      maritalStatus: selectedMaritalStatus!,
      goals: goals!,
      profilePhotoUrl: '', // You need to set the profile photo URL here
    );

    // Update the user profile in the provider
    context.read<UserProfileProvider>().updateUserProfile(userProfile);

    // Navigate to the Survey Page
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SurveyPage()),
    );
  }

  String? validateAge(String? value) {
    if (value == null || value.isEmpty) {
      return 'Age is required';
    }
    if (!isNumeric(value)) {
      return 'Age must be a numeric value';
    }
    return null;
  }

  bool isNumeric(String? value) {
    if (value == null) {
      return false;
    }
    return double.tryParse(value) != null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 135, 213, 249),
        title: const Text(
          'Personal Information',
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 16, top: 35, right: 16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Let's get to know a little bit about you!",
                style: TextStyle(
                  color: Color(0xFFAA77FF),
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 28),
              TextFormField(
                controller: _profileNameController,
                onChanged: (value) {
                  username = value;
                },
                decoration: InputDecoration(
                  labelText: 'Username',
                  fillColor: const Color(0xFFD8B4F8),
                  filled: true,
                  hintStyle: const TextStyle(color: Color(0xFFAA77FF)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFFAA77FF)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                style: const TextStyle(color: Colors.white),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Username is required';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 21),
              TextFormField(
                onChanged: (value) {
                  age = value;
                },
                decoration: InputDecoration(
                  labelText: 'Age',
                  fillColor: const Color(0xFFD8B4F8),
                  filled: true,
                  hintStyle: const TextStyle(color: Color(0xFFAA77FF)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFFAA77FF)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                style: const TextStyle(color: Colors.white),
                validator: validateAge, // Use the custom validator
              ),
              const SizedBox(height: 21),
              DropdownButtonFormField<String>(
                value: selectedGender,
                items: genderOptions.map((String option) {
                  return DropdownMenuItem<String>(
                    value: option,
                    child: Text(
                      option,
                      style: const TextStyle(color: Color(0xFFAA77FF)), // Text color
                    ),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    selectedGender = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Gender',
                  fillColor: const Color(0xFFD8B4F8),
                  filled: true,
                  hintStyle: const TextStyle(color: Color(0xFFAA77FF)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFFAA77FF)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                style: const TextStyle(color: Colors.white),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Gender is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 21),
              TextFormField(
                onChanged: (value) {
                  location = value;
                },
                decoration: InputDecoration(
                  labelText: 'Location',
                  fillColor: const Color(0xFFD8B4F8),
                  filled: true,
                  hintStyle: const TextStyle(color: Color(0xFFAA77FF)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFFAA77FF)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                style: const TextStyle(color: Colors.white),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Location is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 21),
              DropdownButtonFormField<String>(
                value: selectedWorkStatus,
                items: workStatusOptions.map((String option) {
                  return DropdownMenuItem<String>(
                    value: option,
                    child: Text(
                      option,
                      style: const TextStyle(color: Color(0xFFAA77FF)), // Text color
                    ),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    selectedWorkStatus = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Work Status',
                  fillColor: const Color(0xFFD8B4F8),
                  filled: true,
                  hintStyle: const TextStyle(color: Color(0xFFAA77FF)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFFAA77FF)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                style: const TextStyle(color: Colors.white),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Work Status is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 21),
              DropdownButtonFormField<String>(
                value: selectedMaritalStatus,
                items: maritalStatusOptions.map((String option) {
                  return DropdownMenuItem<String>(
                    value: option,
                    child: Text(
                      option,
                      style: const TextStyle(color: Color(0xFFAA77FF)), // Text color
                    ),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    selectedMaritalStatus = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Marital Status',
                  fillColor: const Color(0xFFD8B4F8),
                  filled: true,
                  hintStyle: const TextStyle(color: Color(0xFFAA77FF)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFFAA77FF)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                style: const TextStyle(color: Colors.white),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Marital Status is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 21),
              TextFormField(
                onChanged: (value) {
                  goals = value;
                },
                decoration: InputDecoration(
                  labelText: 'Goals',
                  fillColor: const Color(0xFFD8B4F8),
                  filled: true,
                  hintStyle: const TextStyle(color: Color(0xFFAA77FF)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFFAA77FF)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                style: const TextStyle(color: Colors.white),
              ),

              const SizedBox(height: 16),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await _savePrefs(); // Save profile name
                      _collectUserData(); // Collect user data and navigate
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF97DEFF),
                    minimumSize: const Size(100, 45),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    side: const BorderSide(color: Color(0xFFAA77FF), width: 2),
                  ),
                  child: const Text(
                    'Next',
                    style: TextStyle(fontSize: 25, color: Color(0xFFAA77FF)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UserProfile {
  final String name;
  final String age;
  final String gender;
  final String location;
  final String workStatus;
  final String maritalStatus;
  final String goals;
  final String profilePhotoUrl;

  UserProfile({
    required this.name,
    required this.age,
    required this.gender,
    required this.location,
    required this.workStatus,
    required this.maritalStatus,
    required this.goals,
    required this.profilePhotoUrl,
  });
}

class UserProfileProvider with ChangeNotifier {
  UserProfile? _userProfile;

  UserProfile? get userProfile => _userProfile;

  void updateUserProfile(UserProfile userProfile) {
    _userProfile = userProfile;
    notifyListeners();
  }
}
