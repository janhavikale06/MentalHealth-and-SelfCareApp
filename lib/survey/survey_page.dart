// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:upliftu/profile/profile_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SurveyPage extends StatefulWidget {
  const SurveyPage({Key? key}) : super(key: key);

  @override
  _SurveyPageState createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {

  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    // Initialize SharedPreferences instance
    initSharedPreferences();
  }

  // Function to initialize SharedPreferences
  void initSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }

  // Function to save survey data to SharedPreferences
  void saveSurveyData() {
    // Saving survey data to SharedPreferences
    prefs.setString('selfCareAttitude', selfCareAttitude ?? '');
    prefs.setString('newPeoplePreference', newPeoplePreference ?? '');
    prefs.setString('spareTimeActivity', spareTimeActivity ?? '');
    prefs.setString('typicalSchedule', typicalSchedule ?? '');
    prefs.setString('socialGatheringPreference', socialGatheringPreference ?? '');
    prefs.setString('selfCareActivity', selfCareActivity ?? '');
    prefs.setString('selfCareFrequency', selfCareFrequency ?? '');
    prefs.setString('selfDescription', selfDescription ?? '');
    prefs.setString('socialPreference', socialPreference ?? '');
    prefs.setString('freeTimeActivity', freeTimeActivity ?? '');
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? selfCareActivity;
  String? selfCareFrequency;
  String? selfCareAttitude;
  String? typicalSchedule;
  String? selfDescription;
  String? socialPreference;
  String? freeTimeActivity;
  String? newPeoplePreference;
  String? spareTimeActivity;
  String? socialGatheringPreference; // Added this variable

  List<String> personalityOptions = [
    'Introvert', 'Extrovert', 'Shy', 'Creative', 'Analytical', 
    'Adventurous', 'Organized', 'Messy', 'Spontaneous', 'Ambitious',
  ];

  List<String> newFriendsOptions = [
    'Yes, I love making new friends.',
    'I\'m open to it, but I take my time.',
    'I prefer sticking with my current circle.',
  ];

  List<String> relaxOptions = [
    'Reading a book or watching a movie',
    'Going for a run',
    'Listening to music',
    'Spending time with loved ones',
    'Doing something artistic',
    'Scroll through social media',
    'Simply doing nothing',
    'Take a nap',
  ];

  List<String> spareTimeOptions = [
    'Exercise or workout',
    'Do yoga or meditation',
    'Paint or draw',
    'Write a journal',
    'Play some sport',
    'Reading a book or Watch movies',
    'Explore the outdoors',
    'Take a nap',
  ];

  List<String> scheduleOptions = [
    'Hectic and structured',
    'Balanced with work and leisure',
    'Relaxed and easygoing',
    'Filled with social activities',
    'Mostly focused on work or studies',
    'Involves a lot of socializing',
    'Prioritizes health and fitness',
  ];
  
  List<String> socialGatheringOptions = [
    'Prefer smaller, intimate gatherings.',
    'Enjoy the energy of a crowded event.',
    'Adapt to the situation and feel comfortable.',
    'Feel anxious and try to avoid them.',
    'Planning and organizing the gatherings.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFD8B4F8),
        title: const Text(
          'Survey Questionnaire',
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 17, top: 20, right: 17),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildQuestionAndAnswer(
                question: 'Which word best describes you?',
                options: personalityOptions,
                onChanged: (value) {
                  selfCareAttitude = value;
                },
              ),
              const SizedBox(height: 16),
              _buildQuestionAndAnswer(
                question: 'Do you like making new friends?',
                options: newFriendsOptions,
                onChanged: (value) {
                  newPeoplePreference = value;
                },
              ),
              const SizedBox(height: 16),
              _buildQuestionAndAnswer(
                question: 'What do you like to do in your spare time?',
                options: spareTimeOptions,
                onChanged: (value) {
                  spareTimeActivity = value;
                },
              ),
              const SizedBox(height: 16),
              _buildQuestionAndAnswer(
                question: 'How would you describe your typical schedule?',
                options: scheduleOptions,
                onChanged: (value) {
                  typicalSchedule = value;
                },
              ),
              const SizedBox(height: 16),
              _buildQuestionAndAnswer(
                question: 'How do you handle large social gatherings?',
                options: socialGatheringOptions,
                onChanged: (value) {
                  socialGatheringPreference = value;
                },
              ),
              const SizedBox(height: 16),
              _buildQuestionAndAnswer(
                question: 'What do you usually do when you\'re stressed?',
                options: relaxOptions,
                onChanged: (value) {
                  selfCareActivity = value;
                },
              ),

              const SizedBox(height: 20),

              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                     // Save survey data before navigating to ProfilePage
                    saveSurveyData();
                  // Navigate to Profile Page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ProfilePage(habitsData: [])),
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
                    'Submit',
                    style: TextStyle(fontSize: 21, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 195, 236, 255),
    );
  }

  Widget _buildQuestionAndAnswer({
    required String question,
    required List<String> options,
    required ValueChanged<String> onChanged,
  }) {
    String selectedOption = options[0];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question,
          style: const TextStyle(
            color: Color(0xFFAA77FF),
            fontSize: 19,
          ),
        ),
        const SizedBox(height: 7),
        DropdownButtonFormField<String>(
          value: selectedOption,
          onChanged: (value) {
            setState(() {
              selectedOption = value!;
            });
            onChanged(selectedOption);
          },
          items: options.map<DropdownMenuItem<String>>((String option) {
            return DropdownMenuItem<String>(
              value: option,
              child: Text(
                option,
                style: const TextStyle(
                  color: Color(0xFFAA77FF),
                ),
              ),
            );
          }).toList(),
          decoration: InputDecoration(
            labelText: '',
            fillColor: const Color(0xFFD8B4F8),
            filled: true,
            hintStyle: const TextStyle(color: Colors.white),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFFAA77FF)),
              borderRadius: BorderRadius.circular(10),
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 10.0),
          ),
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
