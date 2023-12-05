// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class StartTrackingButton extends StatelessWidget {
  const StartTrackingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF97DEFF),
        title: const Text(
          'Start Tracking',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          // Perform navigation or any action needed when tapping this button
          Navigator.pop(context); // This will pop the current page to go back
        },
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/home_image.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
