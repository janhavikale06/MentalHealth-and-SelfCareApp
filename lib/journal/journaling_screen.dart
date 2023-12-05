// ignore_for_file: avoid_print, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Package for date formatting

class JournalingScreen extends StatelessWidget {
  const JournalingScreen({Key? key}) : super(key: key);

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
        alignment: Alignment.center,
        children: [
          // Your background image or content
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
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Write About Your Day',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFAA77FF)
                        ),
                      ),
                      const SizedBox(height: 20),
                      const JournalEditor(),
                      const SizedBox(height: 10),
                      Text(
                        'Date: ${DateFormat('yyyy-MM-dd').format(DateTime.now())}', // Display current date
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 18,
                          //fontWeight: FontWeight.bold,
                          color: Color(0xFFAA77FF)
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

class JournalEditor extends StatefulWidget {
  const JournalEditor({Key? key}) : super(key: key);

  @override
  _JournalEditorState createState() => _JournalEditorState();
}

class _JournalEditorState extends State<JournalEditor> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: _textEditingController,
          maxLines: null, // Allows unlimited lines of text
          decoration: const InputDecoration(
            hintText: 'Write here...',
            border: OutlineInputBorder(),
          ),
        ),
        
       ElevatedButton(
          onPressed:saveJournalEntry,
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFAA77FF),
              minimumSize: const Size(80, 36), // Adjust the size as needed
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7),
                side: const BorderSide(color: Color(0xFF97DEFF), width: 1),
              ),
            ),
            child: const Text(
              'Save',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
      ],
    );
  }

  // Function to save the journal entry
  void saveJournalEntry() {
    final String journalEntry = _textEditingController.text;
    if (journalEntry.isNotEmpty) {
      // Handle the journal entry, like saving it or processing it
      // You can store it locally or using a database, etc.
      print('Journal entry saved: $journalEntry');
      _textEditingController.clear(); // Clear the text field after saving
    } else {
      // Show an alert or message if the journal entry is empty
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please write something')),
      );
    }
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}
