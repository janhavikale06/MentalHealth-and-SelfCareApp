import 'package:flutter/material.dart';
import 'package:mental_health/login.dart';

class Splash extends StatefulWidget {
  const Splash ({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome()async{
    await Future.delayed(const Duration(seconds:5), () {});
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
      context, 
      MaterialPageRoute(
        builder: (context) => const Login(
          
    )));
  }

  @override
   Widget build(BuildContext context) {
    const String logo = 'assets/images/logo.jpg';

    return Scaffold(
      backgroundColor: Colors.transparent, // Set background color to transparent
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFD8B4F8), Color(0xFF97DEFF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 105, // Adjust the width and height as needed
                    height: 105,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,      // Background color of the circle
                    ),
                  ),
                  ClipOval(
                    child: Image.asset(
                      logo,
                      width: 100,      // Adjust the width and height as needed
                      height: 100,
                      fit: BoxFit.cover,    // Cover the circular area
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),     // Add some spacing between the image and text
              const Text(
                'Welcome to MindTrack',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}