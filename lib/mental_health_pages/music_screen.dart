// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class MusicScreen extends StatefulWidget {
  const MusicScreen({Key? key}) : super(key: key);

  @override
  _MusicScreenState createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF97DEFF), // Custom AppBar color
        title: const Text(
          'Music Playlist',
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/home_image.jpg'), // Replace with your image asset
            fit: BoxFit.cover,
          ),
        ),
        child: const Center(
          child: Text(
            'Music Page Content',
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
