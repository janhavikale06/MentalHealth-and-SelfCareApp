import 'package:flutter/material.dart';
import 'package:mental_health/profile_page.dart';

class SurveyPage extends StatefulWidget {
  const SurveyPage({Key? key}) : super(key: key);

  @override
  _SurveyPageState createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
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
  ];

  List<String> spareTimeOptions = [
    'Exercise or workout',
    'Do yoga or meditation',
    'Paint or draw',
    'Write a journal',
    'Watch movies',
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
        backgroundColor: const Color.fromARGB(255, 135, 213, 249),
        title: const Text(
          'Survey Questionnaire',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 17, top: 27, right: 17),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 35),
              _buildQuestionAndAnswer(
                question: 'Which word best describes you?',
                options: personalityOptions,
                onChanged: (value) {
                  selfCareAttitude = value;
                },
              ),
              const SizedBox(height: 18),
              _buildQuestionAndAnswer(
                question: 'Do you like making new friends?',
                options: newFriendsOptions,
                onChanged: (value) {
                  newPeoplePreference = value;
                },
              ),
              const SizedBox(height: 18),
              _buildQuestionAndAnswer(
                question: 'What do you like to do in your spare time?',
                options: spareTimeOptions,
                onChanged: (value) {
                  spareTimeActivity = value;
                },
              ),
              const SizedBox(height: 18),
              _buildQuestionAndAnswer(
                question: 'How would you describe your typical schedule?',
                options: scheduleOptions,
                onChanged: (value) {
                  typicalSchedule = value;
                },
              ),
              const SizedBox(height: 18),
              _buildQuestionAndAnswer(
                question: 'How do you handle large social gatherings?',
                options: socialGatheringOptions,
                onChanged: (value) {
                  socialGatheringPreference = value;
                },
              ),
              const SizedBox(height: 18),
              _buildQuestionAndAnswer(
                question: 'What do you usually do when you\'re stressed?',
                options: relaxOptions,
                onChanged: (value) {
                  selfCareAttitude = value;
                },
              ),

              const SizedBox(height: 40),

              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                  // Navigate to Profile Page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
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
                    'Submit',
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
            fontSize: 18,
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
