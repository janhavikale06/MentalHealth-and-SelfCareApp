// ignore_for_file: camel_case_types, library_private_types_in_public_api

import 'package:flutter/material.dart';

class GetFit extends StatefulWidget {
  const GetFit({Key? key}) : super(key: key);

  @override
  _GetFitState createState() => _GetFitState();
}

class _GetFitState extends State<GetFit> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFD8B4F8),
        title: const Text(
          'Goals',
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
              'assets/images/getfit1.png',
              width: 500, // Adjust the width of the image
              height: 220, // Adjust the height of the image
            ),
          ),
          // Texts
           Positioned(
            top: 225,
            bottom: 10, // Adjust the distance from the bottom as needed
            left: 0,
            right: 0,
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Get Fit',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
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
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  children: [
                    const Text(
                      'Taking action can be tougher than giving advice, but change starts with small steps. Here is our list.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFFAA77FF),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    // Custom Line Break
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 380,
                          height: 1,
                          color: const Color(0xFFAA77FF),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    // Text Below the Line Break
                    const Text(
                      'Pick From Our Suggestions',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFAA77FF),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 7),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          buildButton('Cardio Workout', Icons.directions_run),
                          const SizedBox(width: 10),
                          buildButton('Short Exercise', Icons.fitness_center),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          buildButton('Yoga', Icons.self_improvement),
                          const SizedBox(width: 10),
                          buildButton('Cycling', Icons.directions_bike),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          buildButton('Outdoor Jogging', Icons.directions_walk),
                          const SizedBox(width: 10),
                          buildButton('Stretch', Icons.accessibility_new),
                        ],
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

  Widget buildButton(String text, IconData icon) {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(
        onPressed: () {
          // Handle button click
          _showFrequencyModal(context);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 195, 236, 255),
          padding: const EdgeInsets.all(22.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: const Color.fromARGB(255, 210, 183, 254),
              size: 30,
            ),
            const SizedBox(height: 15),
            Text(
              text,
              style: const TextStyle(
                color: Color(0xFFAA77FF),
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

  Future<void> _showFrequencyModal(BuildContext context) async {
  return showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildFrequencyOption('3 days per week'),
            const SizedBox(height: 10),
            _buildFrequencyOption('5 days per week'),
            const SizedBox(height: 10),
            _buildFrequencyOption('Everyday'),
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
                color: Color(0xFFAA77FF),
                fontSize: 18,
                fontWeight: FontWeight.bold,
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
                style: TextStyle(color: Colors.white , fontSize: 16),
              ),
            ),
          ],
        ),
      );
    },
  );
}


  Widget _buildFrequencyOption(String text) {
  return FrequencyOption(
    text: text,
    onChanged: (bool? newValue) {
      setState(() {
        // Handle checkbox changes
        // You can perform any action here based on the checkbox state
        if (newValue == true) {
          counter += 1;
        } else {
          counter -= 1;
        }
      });
    },
  );
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
          widget.onChanged(isChecked);
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
              color: Colors.black, //Color(0xFFAA77FF), // Change the text color
              fontSize: 20,
              //fontWeight: FontWeight.bold // Adjust the font size
            ),
          ),
        ],
      ),
    );
  }


}