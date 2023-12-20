// ignore_for_file: library_private_types_in_public_api, unused_element, iterable_contains_unrelated_type, list_remove_unrelated_type, avoid_print, use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mental_health/sleep_monitoring/sleep_monitoring.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelfCarePage extends StatefulWidget {
  const SelfCarePage({Key? key}) : super(key: key);

  @override
  _SelfCarePageState createState() => _SelfCarePageState();
}

class _SelfCarePageState extends State<SelfCarePage> {
  late SharedPreferences _prefs;
  late String _todayKey;
  List<String> selectedOptions = [];
  List<String> selectedOptionNames = [];

  // Define the available options with associated icons
  final List<Map<String, dynamic>> options = [
    {'name': 'Family', 'icon': Icons.family_restroom_outlined},
    {'name': 'Friends', 'icon': Icons.people_alt_outlined},
    {'name': 'Date', 'icon': Icons.favorite},
    {'name': 'Exercise', 'icon': Icons.fitness_center},
    {'name': 'Movies', 'icon': Icons.tv},
    {'name': 'Work', 'icon': Icons.laptop},
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
  void initState() {
    super.initState();
    _initSharedPreferences();
    _loadSelectedOptions();
  }

  Future<void> _loadSelectedOptions() async {
    final DateTime now = DateTime.now();
    _todayKey = DateFormat('yyyy-MM-dd').format(now);
    _prefs = await SharedPreferences.getInstance();

    if (_prefs.containsKey('selectedOptionsDate')) {
      final DateTime selectedOptionsDate =
          DateTime.parse(_prefs.getString('selectedOptionsDate')!);

      if (now.difference(selectedOptionsDate).inDays == 0) {
        List<String>? optionNames =
            _prefs.getStringList('$_todayKey:selectedOptionNames');
        if (optionNames != null) {
          setState(() {
            selectedOptions = optionNames;
          });
        }
        print('Selected options loaded: $selectedOptions');
      }
    }
  }

  Future<void> _saveSelectedOptions() async {
    await _prefs.setStringList('$_todayKey:selectedOptionNames', selectedOptions);
    await _prefs.setString('selectedOptionsDate', _todayKey);
  }

  Future<void> _initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    _todayKey = DateFormat('yyyy-MM-dd').format(DateTime.now());
  }
  
  Future<void> _showAddOptionDialog() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFFD8B4F8),
          title: const Text(
            'Add New Activity',
            style: TextStyle(color: Colors.white),
          ),
          content: TextField(
            controller: _newOptionController,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              hintText: 'Enter',
              hintStyle: TextStyle(color: Colors.white70),
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xFFAA77FF),
              ),
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.white),
              ),
            ),
            TextButton(
              onPressed: () {
                final String newOption = _newOptionController.text;
                if (newOption.isNotEmpty) {
                  setState(() {
                    options.add({'name': newOption, 'icon': Icons.star});
                    selectedOptions.add(newOption); // Update selectedOptions list with the new option
                  });
                  _newOptionController.clear();
                  Navigator.of(context).pop();
                  _saveSelectedOptions().then((_) {
                    setState(() {}); // Trigger a rebuild after saving selected options
                  });
                }
              },
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xFFAA77FF),
              ),
              child: const Text(
                'Add',
                style: TextStyle(color: Colors.white),
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
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'What have you been up to?',
                  style: TextStyle(
                    fontSize: 30,
                    color: Color.fromRGBO(170, 119, 255, 1),
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
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 15.0),
                Wrap(
                  spacing: 18.0,
                  runSpacing: 16.0,
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
                              _saveSelectedOptions(); // Add this line to save selected options
                            });
                          },
                          child: Container(
                            width: 50.0,
                            height: 50.0,
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
                const SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(padding: const EdgeInsets.only(left: 90.0, right:0),

                    child: Expanded(
                      child: InkWell(
                        onTap: () {
                          _showAddOptionDialog();
                        },
                          child: Container(
                            width: 53.0,
                            height: 53.0,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 177, 135, 246),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: const Color(0xFF97DEFF),
                                width: 1.5,
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
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          // Save the selected options somewhere or perform an action
                          // Format the current date
                          String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

                          // Display the selected options along with date
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Selected options: ${selectedOptions.join(', ')} on $formattedDate',
                                style: const TextStyle(color: Colors.white),
                              ),
                              backgroundColor: const Color(0xFF97DEFF),
                            ),
                          );
                        },
                        
                          child: Container(
                            width: 53.0,
                            height: 53.0,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 177, 135, 246),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: const Color(0xFF97DEFF),
                                width: 1.5,
                              ),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.check,
                                color: Colors.white,
                              ),
                            ),
                          ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 35.0),
                if (selectedOptions.isNotEmpty)
                  // Add a Container around the selected options
                  Container(
                    padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 195, 236, 255),
                      border: Border.all(color: const Color(0xFF97DEFF), width: 2),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'Selected Options',
                          style: TextStyle(
                            fontSize: 24,
                            color: Color(0xFFAA77FF),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 7),
                        Text(
                          'Date: $_todayKey', // Show the current date
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xFFAA77FF),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Wrap(
                          spacing: 10.0,
                          runSpacing: 5.0,
                          children: selectedOptions
                              .map((option) => Chip(
                                    label: Text(option),
                                    backgroundColor: const Color(0xFFD8B4F8),
                                    labelStyle: const TextStyle(color: Colors.white),
                                  ))
                              .toList(),
                        ),
                        const SizedBox(height: 20.0),
                      ],
                    ),
                  ),
                   
                const SizedBox(height: 35.0),
                const Text('Sleep Monitoring Tracker',
                  style: TextStyle(
                    fontSize: 28,
                    color: Color.fromRGBO(170, 119, 255, 1),
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
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 28.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TrackerColumn(
                      imagePath: 'assets/images/sleeptracker.png',
                      height: 100,
                      width: 210,
                      imagePadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.01),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SleepMonitoringPage()),
                        );
                      },
                      trackerName: '',
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
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
                          borderRadius: BorderRadius.circular(8),
                          side: const BorderSide(color: Color(0xFF97DEFF), width: 2),
                        ),
                      ),
                      child: const Text(
                        'Sleep Monitoring',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    )
                  ],
                ),
              ],
            ),
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

  const TrackerColumn({
    Key? key,
    required this.imagePath,
    required this.height,
    required this.width,
    required this.imagePadding,
    required this.onPressed,
    required String trackerName,
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
