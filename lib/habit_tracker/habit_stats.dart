import 'package:flutter/material.dart';
import 'package:upliftu/habit_tracker/habit_tracker.dart';
import 'package:upliftu/profile/profile_page.dart';

class CompletedHabitsPage extends StatelessWidget {
  final DateTime selectedDate;
  final List<Habit> completedHabits;
  final List<DateTime> dates;
  final Map<String, dynamic> completedHabitsMap;

  const CompletedHabitsPage({
    Key? key,
    required this.selectedDate,
    required this.completedHabits,
    required this.dates,
    required this.completedHabitsMap,
    required List completedHabitDates,
  }) : super(key: key);

  void _navigateToProfilePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ProfilePage(habitsData: [[]]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFD8B4F8),
        title: const Text(
          'Habit Names list',
          style: TextStyle(
            fontSize: 23,
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/home_image.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 20),
                itemCount: completedHabits.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30, top: 0, bottom: 5),
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 195, 236, 255),
                        border: Border.all(color: const Color(0xFF97DEFF), width: 2),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: ListTile(
                        title: Text(
                          completedHabits[index].name,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Color(0xFFAA77FF),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 30),
              child: ElevatedButton(
                onPressed: () {
                  _navigateToProfilePage(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFAA77FF),
                  minimumSize: const Size(double.infinity, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  side: const BorderSide(color: Color(0xFFAA77FF), width: 2),
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
