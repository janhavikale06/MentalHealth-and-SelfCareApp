import 'package:flutter/material.dart';
import 'package:mental_health/Goals/creategoal.dart';
import 'package:mental_health/habit_tracker.dart';
import 'package:mental_health/mood_tracker.dart';
import 'package:mental_health/social_tracker.dart';

class TrackersPage extends StatelessWidget {
  const TrackersPage({Key? key}) : super(key: key);

  @override
Widget build(BuildContext context) {
  return Stack(
    children: [
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 70),
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color:const Color.fromARGB(255, 195, 236, 255),
                border: Border.all(color: const Color(0xFF97DEFF), width: 2),
                borderRadius: BorderRadius.circular(7),
              ),
              child: Column(
                children: [
                  const Text(
                    "Create New Goal",
                    style: TextStyle(
                      fontSize: 30, 
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFAA77FF),
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
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Time to take on a challenge and elevate your life.",
                    style: TextStyle(fontSize: 19, color: Color(0xFFAA77FF)),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to the next page for goal creation
                      // Replace the following line with your navigation logic
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const CreateGoal()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFAA77FF),
                      minimumSize: const Size(100, 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: const Text(
                      'Create',
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height:40),
          const Text(
            "Trackers",
            //textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 30, 
              fontWeight: FontWeight.bold,
              color: Color(0xFFAA77FF),
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
            ),
            ),

            const SizedBox(height: 17),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TrackerColumn(
                  imagePath: 'assets/images/moodtracker1.png',
                  trackerName: 'Mood Tracker',
                  height: 150,
                  width: 190,
                  imagePadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MoodTrackerPage()),
                    );
                  },
                ),
                TrackerColumn(
                  imagePath: 'assets/images/habitracker1.png',
                  trackerName: 'Habit Tracker',
                  height: 150,
                  width: 190,
                  imagePadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0.01),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HabitTrackerPage(updateHabits: (List<Habit> updatedHabits) {})),
                    );
                  },
                ),
              ],
            ),
            Center(
              child: TrackerColumn(
                imagePath: 'assets/images/socialMtracker1.png',
                trackerName: 'Social Media Apps Tracker',
                height: 116,
                width: 200,
                imagePadding: const EdgeInsets.only(top: 10, bottom: 3),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SocialMediaTrackerPage()),
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class TrackerColumn extends StatelessWidget {
  final String imagePath;
  final String trackerName;
  final double height;
  final double width;
  final EdgeInsetsGeometry imagePadding;
  final VoidCallback onPressed;

  const TrackerColumn({
    Key? key,
    required this.imagePath,
    required this.trackerName,
    required this.height,
    required this.width,
    required this.imagePadding,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: imagePadding,
          child: Image.asset(imagePath, height: height, width: width),
        ),
        ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: const Color(0xFFAA77FF),
            minimumSize: const Size(20, 40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(color: Color(0xFF97DEFF), width: 2),
            ),
          ),
          child: Text(
            trackerName,
            style: const TextStyle(fontSize: 17, color: Colors.white),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
