// ignore_for_file: avoid_print, library_private_types_in_public_api
import 'package:flutter/material.dart';
//import 'package:upliftu/profile/personal_details.dart';
import 'package:upliftu/survey/know_more_page.dart';

class UserProfile {
  final String fullname;
  final String name;
  final int age;
  final String gender;
  final String location;
  final String workStatus;
  final String maritalStatus;
  final String goals;

  UserProfile({
    required this.fullname,
    required this.name,
    required this.age,
    required this.gender,
    required this.location,
    required this.workStatus,
    required this.maritalStatus,
    required this.goals,
  });
}

class UserSurvey extends StatefulWidget {
  const UserSurvey({Key? key}) : super(key: key);

  @override
  _UserSurveyState createState() => _UserSurveyState();
}

class _UserSurveyState extends State<UserSurvey> {
  final PageController _pageController = PageController();
  int currentIndex = 0;

  final List<String> questions = [
    'Question 1\n\n\nWhich app features are you most interested in using?',
    'Question 2\n\n\nHow often do you feel like interacting with the app on a daily basis?',
    'Question 3\n\n\nWould you like to discuss your ideas and achievements with others?',
  ];

  List<List<String>> selectedOptions = List.filled(3, []);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD8B4F8),
      appBar: AppBar(
        backgroundColor: const Color(0xFF97DEFF),
        title: const Text(
          'User Survey',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: questions.length,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return buildQuestionWidget(questions[index], index);
                },
              ),
            ),
            Text(
              'Question ${currentIndex + 1} of ${questions.length}',
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget buildQuestionWidget(String question, int index) {
    List<String> options = [];

    if (index == 0) {
      options = ['Trackers', 'Self Care Options', 'Mental Health Options'];
    } else if (index == 1) {
      options = ['4 times per day', '3 times per day'];
    } else if (index == 2) {
      options = [
        'Yes, Knowing I am not alone\nis comforting.',
        'No, I prefer to keep to myself.'
      ];
    }

    List<String> selectedAnswer = selectedOptions[index];

    return buildSurveyQuestionAndAnswer(
      question: question,
      options: options,
      selectedOptions: selectedAnswer,
      onChanged: (value) {
        setState(() {
          selectedOptions[index] = [value];
        });
      },
    );
  }

  Widget buildSurveyQuestionAndAnswer({
    required String question,
    required List<String> options,
    required List<String> selectedOptions,
    required ValueChanged<String> onChanged,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 195, 236, 255),
            border: Border.all(color: const Color(0xFF97DEFF), width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                question,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 23,
                  color: Color(0xFFAA77FF),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.only(left: 10,right: 10),
                decoration: BoxDecoration(
                  color: const Color(0xFF97DEFF),
                  borderRadius: BorderRadius.circular(8.0), // Optional: Set border radius
                ),
                child: DropdownButton<String>(
                  value: selectedOptions.isNotEmpty ? selectedOptions[0] : null,
                  onChanged: (String? newValue) {
                    onChanged(newValue!);
                  },
                  items: options.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(
                          color: Color(0xFFAA77FF), // Set text color
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            if (selectedOptions.isNotEmpty) {
              if (currentIndex < questions.length - 1) {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              } else {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => KnowMorePage( // Change to KnowMorePage
                      selectedOptions: selectedOptions,
                    ),
                  ),
                );
              }
            } else {
              print('Please select an answer.');
            }
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
            'Next',
            style: TextStyle(fontSize: 21, color: Colors.white),
          ),
        ),
      ],
    );
  }
}