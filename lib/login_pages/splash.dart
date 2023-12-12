// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mental_health/login_pages/sign_up.dart';

class UserProfileProvider with ChangeNotifier {
  List<String> habits = ['Reading', 'Exercise', 'Meditation'];

  void deleteHabit(String habit) {
    habits.remove(habit);
    notifyListeners();
  }
}

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(const Duration(seconds: 4), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => SignUpScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const String logo = 'assets/images/logo.jpg';

    return ChangeNotifierProvider(
      create: (_) => UserProfileProvider(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
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
                      width: 105,
                      height: 105,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                    ),
                    ClipOval(
                      child: Image.asset(
                        logo,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  'Welcome to MindTrack',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                /*
                Consumer<UserProfileProvider>(
                  builder: (context, userProfileProvider, child) {
                    return ElevatedButton(
                      onPressed: () {
                        // Delete the first habit from the list
                        if (userProfileProvider.habits.isNotEmpty) {
                          userProfileProvider.deleteHabit(
                              userProfileProvider.habits.first);
                        }
                      },
                      child: const Text('Delete First Habit'),
                    );
                  },
                ), */
              ],
            ),
          ),
        ),
      ),
    );
  }
}
