import 'package:flutter/material.dart';


// ignore: camel_case_types
class JournalingScreen extends StatefulWidget {
  const JournalingScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _JournalingScreen createState() => _JournalingScreen();
}

class _JournalingScreen extends State<JournalingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFD8B4F8),
        title: const Text(
          'Journaling Sessions',
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
      ),
      body: Container(
        color:  const Color.fromARGB(255, 135, 213, 249), // Background color
        child: const Center(
          // Your profile page content goes here
          child: Text(
            'Journaling Page Content',
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
