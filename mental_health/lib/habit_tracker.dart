import 'package:flutter/material.dart';


// ignore: camel_case_types
class HabitTrackerPage extends StatefulWidget {
  const HabitTrackerPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<HabitTrackerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFD8B4F8),
        title: const Text(
          'Habit Tracker',
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
      ),
      body: Container(
        color: const Color.fromARGB(255, 135, 213, 249), // Background color
        child: const Center(
          // Your profile page content goes here
          child: Text(
            'Habit tracker Content',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}


