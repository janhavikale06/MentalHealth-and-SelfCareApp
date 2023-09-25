import 'package:flutter/material.dart';
import 'package:mental_health/profile_page.dart';

class KnowMorePage extends StatefulWidget {
  const KnowMorePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _KnowMorePageState createState() => _KnowMorePageState();
}

class _KnowMorePageState extends State<KnowMorePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? username;
  String? age;
  String? gender;
  String? location;
  String? workStatus;
  String? maritalStatus;

  // Custom validator for numeric age
  String? validateAge(String? value) {
    if (value == null || value.isEmpty) {
      return 'Age is required';
    }
    if (!isNumeric(value)) {
      return 'Age must be a numeric value';
    }
    return null;
  }

  // Helper function to check if a string consists of digits
  bool isNumeric(String? value) {
    if (value == null) {
      return false;
    }
    return double.tryParse(value) != null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 135, 213, 249),
        title: const Text(
          'Personal Information',
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 16, top: 35, right: 16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Let's get to know a little bit about you!",
                style: TextStyle(
                  color: Color(0xFFAA77FF),
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 28),
              TextFormField(
                onChanged: (value) {
                  username = value;
                },
                decoration: InputDecoration(
                  labelText: 'Username',
                  fillColor: const Color(0xFFD8B4F8),
                  filled: true,
                  hintStyle: const TextStyle(color: Color(0xFFAA77FF)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFFAA77FF)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                style: const TextStyle(color: Colors.white),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Username is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 21),
              TextFormField(
                onChanged: (value) {
                  age = value;
                },
                decoration: InputDecoration(
                  labelText: 'Age',
                  fillColor: const Color(0xFFD8B4F8),
                  filled: true,
                  hintStyle: const TextStyle(color: Color(0xFFAA77FF)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFFAA77FF)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                style: const TextStyle(color: Colors.white),
                validator: validateAge, // Use the custom validator
              ),
              const SizedBox(height: 21),
              TextFormField(
                onChanged: (value) {
                  gender = value;
                },
                decoration: InputDecoration(
                  labelText: 'Gender',
                  fillColor: const Color(0xFFD8B4F8),
                  filled: true,
                  hintStyle: const TextStyle(color: Color(0xFFAA77FF)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFFAA77FF)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                style: const TextStyle(color: Colors.white),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Gender is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 21),
              TextFormField(
                onChanged: (value) {
                  location = value;
                },
                decoration: InputDecoration(
                  labelText: 'Location',
                  fillColor: const Color(0xFFD8B4F8),
                  filled: true,
                  hintStyle: const TextStyle(color: Color(0xFFAA77FF)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFFAA77FF)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                style: const TextStyle(color: Colors.white),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Location is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 21),
              TextFormField(
                onChanged: (value) {
                  workStatus = value;
                },
                decoration: InputDecoration(
                  labelText: 'Work Status',
                  fillColor: const Color(0xFFD8B4F8),
                  filled: true,
                  hintStyle: const TextStyle(color: Color(0xFFAA77FF)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFFAA77FF)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                style: const TextStyle(color: Colors.white),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Work Status is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 21),
              TextFormField(
                onChanged: (value) {
                  maritalStatus = value;
                },
                decoration: InputDecoration(
                  labelText: 'Marital Status',
                  fillColor: const Color(0xFFD8B4F8),
                  filled: true,
                  hintStyle: const TextStyle(color: Color(0xFFAA77FF)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFFAA77FF)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                style: const TextStyle(color: Colors.white),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Marital Status is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 21),
              TextFormField(
                onChanged: (value) {
                  // Handle the input for goals
                },
                decoration: InputDecoration(
                  labelText: 'Goals',
                  fillColor: const Color(0xFFD8B4F8),
                  filled: true,
                  hintStyle: const TextStyle(color: Color(0xFFAA77FF)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFFAA77FF)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 22),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // All fields are valid, continue to the next page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const profilePage()),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF97DEFF),
                    minimumSize: const Size(110, 47),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    side: const BorderSide(color: Color(0xFFAA77FF), width: 2),
                  ),
                  child: const Text(
                    'Next',
                    style: TextStyle(fontSize: 28, color: Color(0xFFAA77FF)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
