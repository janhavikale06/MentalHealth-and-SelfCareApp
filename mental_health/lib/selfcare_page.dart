import 'package:flutter/material.dart';
//import 'package:mental_health/pains_gains.dart';
import 'package:mental_health/sleep_monitoring.dart';

class SelfCarePage extends StatefulWidget {
  const SelfCarePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SelfCarePageState createState() => _SelfCarePageState();
}

class _SelfCarePageState extends State<SelfCarePage> {
  List<String> selectedOptions = [];

  // Define the available options with associated icons
  final List<Map<String, dynamic>> options = [
    {'name': 'Family', 'icon': Icons.family_restroom_outlined},
    {'name': 'Friends', 'icon': Icons.people_alt_outlined},
    {'name': 'Date', 'icon': Icons.favorite},
    {'name': 'Exercise', 'icon': Icons.fitness_center},
    {'name': 'Movies', 'icon': Icons.tv},
    {'name': 'Pet', 'icon': Icons.pets},
    {'name': 'Gaming', 'icon': Icons.sports_esports},
    {'name': 'Reading', 'icon': Icons.book},
    {'name': 'Dining', 'icon': Icons.restaurant_menu},
    {'name': 'Shopping', 'icon': Icons.shopping_cart},
    {'name': 'Travel', 'icon': Icons.airplanemode_active},
    {'name': 'Swim', 'icon': Icons.pool},
  ];

  final TextEditingController _newOptionController = TextEditingController();

  @override
  void dispose() {
    _newOptionController.dispose();
    super.dispose();
  }

  // ignore: unused_element
  Future<void> _showAddOptionDialog() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFFD8B4F8), // Background color
          title: const Text(
            'Add New Activity',
            style: TextStyle(color: Colors.white), // Title text color
          ),
          content: TextField(
            controller: _newOptionController,
            style: const TextStyle(color: Colors.white), // Text field text color
            decoration: const InputDecoration(
              hintText: 'Enter',
              hintStyle: TextStyle(color: Colors.white70), // Hint text color
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xFFAA77FF), // Button background color
              ),
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.white), // Button text color
              ),
            ),
            TextButton(
              onPressed: () {
                // Add your code to handle adding the new option here
                final String newOption = _newOptionController.text;
                if (newOption.isNotEmpty) {
                  // Add the new option to your list
                  options.add({'name': newOption, 'icon': Icons.star}); // You can use any default icon here
                  // Clear the text field
                  _newOptionController.clear();
                  // Close the dialog
                  Navigator.of(context).pop();
                  setState(() {});
                }
              },
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xFFAA77FF), // Button background color
              ),
              child: const Text(
                'Add',
                style: TextStyle(color: Colors.white), // Button text color
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 75),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text(
                'What have you been up to?',
                style: TextStyle(
                  fontSize: 31,
                  color: Color(0xFFAA77FF),
                  shadows: [
                    Shadow(
                      color: Colors.white, 
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
              const SizedBox(height: 20.0),
              Wrap(
                spacing: 22.0,
                runSpacing: 13.0,
                children: options.map((option) {
                  final IconData icon = option['icon'];
                  final String optionName = option['name'];
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            if (selectedOptions.contains(optionName)) {
                              selectedOptions.remove(optionName);
                            } else {
                              selectedOptions.add(optionName);
                            }
                          });
                        },
                        child: Container(
                          width: 55.0,
                          height: 55.0,
                          decoration: BoxDecoration(
                            color: selectedOptions.contains(optionName)
                                ? const Color(0xFFD8B4F8)
                                : const Color(0xFF97DEFF),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: const Color(0xFFD8B4F8),
                              width: 1.0,
                            ),
                          ),
                          child: Center(
                            child: Icon(
                              icon,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        optionName,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 156, 104, 238),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),

              const SizedBox(height: 20.0),

              InkWell(
                onTap: () {
                  _showAddOptionDialog(); // Show the "Add New Option" dialog
                },
                child: Container(
                  width: 55.0,
                  height: 55.0,
                  decoration:  BoxDecoration(
                    color: const Color(0xFF97DEFF),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFFD8B4F8),
                      width: 1.0,
                    ),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 70.0),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Sleep Monitoring Column
                  TrackerColumn(
                  imagePath: 'assets/images/sleeptracker.png',
                  height: 123,
                  width: 253,
                  imagePadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.01),
                  onPressed: () {
                    // Navigate to Sleep Monitoring Page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SleepMonitoringPage()),
                    );
                  }, trackerName: '',
                ),
              ],
            ),

            const SizedBox(height:6),

            Row(
              mainAxisAlignment: MainAxisAlignment.center, // Center the buttons
              children: [
                ElevatedButton(
                onPressed: () {
                  // Navigate to Sleep Monitoring Page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SleepMonitoringPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: const Color(0xFFAA77FF),
                  minimumSize: const Size(20, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: Color(0xFF97DEFF), width: 2),
                  ),
                ),
                child: const Text(
                  'Sleep Monitoring' ,
                  style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TrackerColumn extends StatelessWidget {
  final String imagePath;
  final double height;
  final double width;
  final EdgeInsetsGeometry imagePadding;
  final VoidCallback onPressed;

  // ignore: use_key_in_widget_constructors
  const TrackerColumn({
    Key? key,
    required this.imagePath,
    required this.height,
    required this.width,
    required this.imagePadding,
    required this.onPressed, required String trackerName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ),
         
        const Text(
            '',
            style: TextStyle(fontSize: 3, color: Colors.white),
          ),
      ],
    );
  }
}