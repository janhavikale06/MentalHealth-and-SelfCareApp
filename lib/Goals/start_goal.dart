// StartGoal.dart
// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class StartGoal extends StatefulWidget {
  const StartGoal({Key? key}) : super(key: key);

  @override
  _StartGoalState createState() => _StartGoalState();

  Future<void> showFrequencyModal(BuildContext context) async {
    final state = _StartGoalState();
    return state._showFrequencyModal(context);
  }
}

class _StartGoalState extends State<StartGoal> {
  Future<void> _showFrequencyModal(BuildContext context) async {
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildFrequencyOption('3 days per week', (bool? newValue) {
                // Handle checkbox changes for '3 days per week' here
              }),
              const SizedBox(height: 10),
              _buildFrequencyOption('5 days per week', (bool? newValue) {
                // Handle checkbox changes for '5 days per week' here
              }),
              const SizedBox(height: 10),
              _buildFrequencyOption('Everyday', (bool? newValue) {
                // Handle checkbox changes for 'Everyday' here
              }),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  // Handle "Start Goal" button click
                  Navigator.pop(context); // Close the bottom sheet
                  _showConfirmationDialog(context); // Show the confirmation dialog
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFAA77FF),
                ),
                child: const Text(
                  'Start Goal',
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'The remainders will be sent to you',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  //fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFAA77FF),
                ),
                child: const Text(
                  'OK',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFrequencyOption(String text, Function(bool?) onChanged) {
    return FrequencyOption(
      text: text,
      onChanged: onChanged,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class FrequencyOption extends StatefulWidget {
  final String text;
  final Function(bool?) onChanged;

  const FrequencyOption({
    Key? key,
    required this.text,
    required this.onChanged,
  }) : super(key: key);

  @override
  _FrequencyOptionState createState() => _FrequencyOptionState();
}

class _FrequencyOptionState extends State<FrequencyOption> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
          widget.onChanged(isChecked); // Notify the parent about the change
        });
      },
      child: Row(
        children: [    
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isChecked ? const Color(0xFFAA77FF) : Colors.white,
              border: Border.all(
                color: isChecked ? const Color(0xFFAA77FF) : Colors.grey,
                width: 1.0,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Icon(
                Icons.check,
                size: 24, // Adjust the size of the checkbox icon
                color: isChecked ? Colors.white : Colors.transparent,
              ),
            ),
          ),
          const SizedBox(width: 13),
          Text(
            widget.text,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}


