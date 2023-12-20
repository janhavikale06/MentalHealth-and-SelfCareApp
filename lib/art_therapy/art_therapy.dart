// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:mental_health/art_therapy/gardening_page.dart';
import 'package:mental_health/art_therapy/origami_page.dart';
import 'package:mental_health/art_therapy/painting_page.dart';
import 'package:mental_health/art_therapy/pottery_page.dart';

class ArtTherapyPage extends StatefulWidget {
  const ArtTherapyPage({Key? key}) : super(key: key);

  @override
  _ArtTherapyPageState createState() => _ArtTherapyPageState();
}

class _ArtTherapyPageState extends State<ArtTherapyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF97DEFF),
        title: const Text(
          'Art Therapy',
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/home_image.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                height: 220, // Adjust the height as needed
                child: Image.asset(
                  'assets/images/art_therapy.png',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 25),
              const Text(
                'Fun Suggestions',
                style: TextStyle(
                  fontSize: 29,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      color: Colors.white,
                      offset: Offset(-1, -1),
                      blurRadius: 5,
                    ),
                    Shadow(
                      color: Color(0xFF97DEFF),
                      offset: Offset(1, 1),
                      blurRadius: 5,
                    ),
                  ],
                  color: Color(0xFFAA77FF),
                ),
              ),
              const SizedBox(height: 10),
              _buildGrid(),
              const SizedBox(height: 70),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGrid() {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildRectangle('Pottery'),
              _buildRectangle('Origami'),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildRectangle('Painting'),
              _buildRectangle('Gardening'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRectangle(String iconText) {
    IconData iconData;
    // Assign different icons based on the category
    switch (iconText) {
      case 'Pottery':
        iconData = Icons.category;
        break;
      case 'Origami':
        iconData = Icons.directions_boat;
        break;
      case 'Painting':
        iconData = Icons.palette;
        break;
      case 'Gardening':
        iconData = Icons.eco;
        break;
      default:
        iconData = Icons.create;
        break;
    }

    return InkWell(
      onTap: () {
        _navigateToCategoryPage(iconText); // Replace with your navigation logic
      },
      child: Container(
        width: 160,
        height: 180,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 5.0,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Add your icon here
            Icon(
              iconData,
              size: 45, // Adjust the size as needed
              color: const Color(0xFFD8B4F8),
            ),

            const SizedBox(height: 25),

            // Add your description text here
            Text(
              iconText,
              style: const TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Color(0xFFAA77FF),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToCategoryPage(String category) {
    // Implement your navigation logic based on the selected category
    // For example:
    if (category == 'Pottery') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const PotteryPage()),
      );
    } else if (category == 'Origami') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const OrigamiPage()),
      );
    } else if (category == 'Painting') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const PaintingPage()),
      );
    } else if (category == 'Gardening') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const GardeningPage()),
      );
    }
  }
}
