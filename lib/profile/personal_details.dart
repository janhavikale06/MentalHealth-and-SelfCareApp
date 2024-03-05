// ignore_for_file: library_private_types_in_public_api, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:upliftu/survey/know_more_page.dart';

class PersonalDetailsPage extends StatefulWidget {
  final UserProfile userProfile;
  final String profilePhotoPath; // Add profile photo path
  final List<List<String>> selectedOptions;
  final List<String> questions;

  const PersonalDetailsPage({
    Key? key,
    required this.userProfile,
    required this.profilePhotoPath, // Receive profile photo path
    required this.selectedOptions,
    required this.questions,
  }) : super(key: key);

  @override
  _PersonalDetailsPageState createState() => _PersonalDetailsPageState();
}

class _PersonalDetailsPageState extends State<PersonalDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final userProfile = widget.userProfile; // Use widget.userProfile
    final profilePhotoPath = widget.profilePhotoPath;
    final selectedOptions = widget.selectedOptions;
    final questions = widget.questions;

    if (userProfile == null) {
      return const Scaffold(
        body: Center(
          child: Text('User data not available'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFD8B4F8),
        title: const Text(
          'Personal Details',
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/home_image.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset(
                    'assets/images/profilepage2.png',
                    width: 425,
                    height: 244,
                  ),
                  Positioned(
                    top: 26,
                    left: 105,
                    child: CircleAvatar(
                      radius: 100,
                      backgroundColor: Colors.transparent,
                      backgroundImage: profilePhotoPath.isNotEmpty
                          ? AssetImage(profilePhotoPath)
                          : const AssetImage('assets/images/profile3.png'),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                color: Colors.transparent,
                child: Center(
                  child: Container(
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.only(
                      left: 30.0,
                      right: 10.0,
                      top: 15.0,
                      bottom: 15.0,
                    ),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 195, 236, 255),
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: const Color(0xFF97DEFF), width: 2),
                    ),
                    child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        for (int i = 0; i < questions.length; i++)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Question ${i + 1}: ${questions[i]}',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFAA77FF),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Your Answer: ${selectedOptions[i].isNotEmpty ? selectedOptions[i][0] : ''}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Color(0xFFAA77FF),
                                ),
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                        _buildDetailRow('Name:                 ', userProfile.fullname),
                        _buildDetailRow('Username:         ', userProfile.name),
                        _buildDetailRow('Age:                     ', userProfile.age.toString()),
                        _buildDetailRow('Gender:               ', userProfile.gender),
                        _buildDetailRow('Location:             ', userProfile.location),
                        _buildDetailRow('Work Status:       ', userProfile.workStatus),
                        _buildDetailRow('Marital Status:    ', userProfile.maritalStatus),
                        _buildDetailRow('Goals:                   ''\n', userProfile.goals),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 20, color: Color(0xFFAA77FF), fontWeight: FontWeight.bold),
        ),
        Flexible(
          child: TextField(
            readOnly: true,
            decoration: InputDecoration(
              hintText: value,
              border: InputBorder.none,
              hintStyle: const TextStyle(fontSize: 19, color: Color(0xFFAA77FF)),
            ),
          ),
        ),
      ],
    );
  }
}