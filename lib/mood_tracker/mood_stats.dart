// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class MoodStatsPage extends StatefulWidget {
  final Map<String, int> moodCounts;

  const MoodStatsPage({Key? key, required this.moodCounts}) : super(key: key);

  @override
  _MoodStatsPageState createState() => _MoodStatsPageState();
}

class _MoodStatsPageState extends State<MoodStatsPage> {
  
  Map<String, int> moodCounts = {}; // Declare moodCounts here

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFD8B4F8),
        title: const Text(
          'Mood Statistics',
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/home_image.jpg'), // Replace with your image asset
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Mood Analysis',
                    style: TextStyle(
                      fontSize: 28,
                      color: Color.fromRGBO(170, 119, 255, 1),
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
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: widget.moodCounts.entries.map((entry) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '${entry.key}: ${entry.value}',
                          style: const TextStyle(fontSize: 18),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
