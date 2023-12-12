// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import shared_preferences

class JournalingScreen extends StatefulWidget {
  const JournalingScreen({Key? key}) : super(key: key);

  @override
  _JournalingScreenState createState() => _JournalingScreenState();
}

class _JournalingScreenState extends State<JournalingScreen> {
  late TextEditingController _textEditingController;
  late SharedPreferences _prefs;
  String journalEntry = '';

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    initializeSharedPreferences();
  }

  void initializeSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    final currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    setState(() {
      journalEntry = _prefs.getString(currentDate) ?? ''; // Retrieve journalEntry from SharedPreferences
      _textEditingController.text = ''; // Clear the text field initially
    });
  }

  void saveJournalEntry(String entry) async {
    final currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    await _prefs.setString(currentDate, entry); // Save journalEntry to SharedPreferences
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF97DEFF),
        title: const Text(
          'Journaling',
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
      ),
      body: Stack(
        children: [
          // Background Image
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/home_image.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Additional Image on Top
          Positioned(
            child: Image.asset(
              'assets/images/journal.png',
              width: 420, // Adjust the width of the image
              height: 190, // Adjust the height of the image
            ),
          ),
          Positioned(
            top: 90,
            bottom: 10, // Adjust the distance from the bottom as needed
            left: 0,
            right: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Write About Your Day',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
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
                    color: Color(0xFFAA77FF),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    controller: _textEditingController,
                    maxLines: null,
                    decoration: const InputDecoration(
                      hintText: 'Write here...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 150),
                  child: ElevatedButton(
                    onPressed: () {
                      final entry = _textEditingController.text;
                      if (entry.isNotEmpty) {
                        saveJournalEntry(entry);
                        setState(() {
                          journalEntry = entry;
                          _textEditingController.text = ''; // Clear the text field after saving
                        });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Please write something')),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFAA77FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                        side: const BorderSide(color: Color(0xFF97DEFF), width: 1),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical:8), // Adjust padding as needed
                      child: Text(
                        'Save',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30), // Spacing
                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: const Color(0xFF97DEFF),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 5.0,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          DateFormat('dd-MM-yyyy').format(DateTime.now()),
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xFFAA77FF),
                          ),
                        ),
                      ),
                      const SizedBox(width: 25),
                      Expanded(
                        child: Text(
                          journalEntry,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Color(0xFFAA77FF),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
