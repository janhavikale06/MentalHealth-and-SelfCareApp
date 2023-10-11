import 'package:flutter/material.dart';

// ignore: camel_case_types
class profilePage extends StatefulWidget {
  const profilePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<profilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
      ),
      body: Container(
        color: const Color(0xFFD8B4F8), // Background color
        child: const Center(
          // Your profile page content goes here
          child: Text(
            'Profile Content',
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
