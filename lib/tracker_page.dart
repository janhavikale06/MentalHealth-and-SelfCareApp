import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:mental_health/mood_tracker.dart';
import 'package:mental_health/habit_tracker.dart';
import 'package:mental_health/social_tracker.dart';

class TrackersPage extends StatelessWidget {
  const TrackersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Add the Calendar widget here
        const CalendarWidget(),
        const SizedBox(height: 8),
        // Mood Tracker and Habit Tracker side by side in one row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Adjust the alignment as needed
          children: [
            // Mood Tracker Column
            TrackerColumn(
              imagePath: 'assets/images/moodtracker.png', // Replace with actual image path
              trackerName: 'Mood Tracker',
              height: 130,
              width: 160,
              imagePadding: const EdgeInsets.symmetric(horizontal: 16.0 , vertical: 4),
              onPressed: () {
                // Navigate to Mood Tracker Page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MoodTrackerPage()),
                );
              },
            ),
            // Habit Tracker Column
            TrackerColumn(
              imagePath: 'assets/images/habitracker.png', // Replace with actual image path
              trackerName: 'Habit Tracker',
              height: 140,
              width: 180,
              imagePadding: const EdgeInsets.symmetric(horizontal: 16.0 , vertical: 0.01),
              onPressed: () {
                // Navigate to Habit Tracker Page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HabitTrackerPage()),
                );
              },
            ),
          ],
        ),
        // Empty space for spacing between rows
        const SizedBox(height: 1),
        // Social Tracker Column in the middle
        Center(
          child: TrackerColumn(
            imagePath: 'assets/images/socialMtracker.png', // Replace with actual image path
            trackerName: 'Social Media Apps Tracker',
            height: 130,
            width: 160,
            imagePadding: const EdgeInsets.symmetric(horizontal: 10.0 , vertical: 10),
            onPressed: () {
              // Navigate to Social Tracker Page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SocialMediaTrackerPage()),
              );
            },
          ),
        ),
      ],
    );
  }
}

class TrackerColumn extends StatelessWidget {
  final String imagePath;
  final String trackerName;
  final double height; // Specify height
  final double width; // Specify width
  final EdgeInsetsGeometry imagePadding; // Specify image padding
  final VoidCallback onPressed;

  const TrackerColumn({super.key, 
    required this.imagePath,
    required this.trackerName,
    required this.height,
    required this.width,
    required this.imagePadding,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: imagePadding, // Add image padding
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

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32, left: 19, right: 19),
      child: TableCalendar(
        firstDay: DateTime(2000),
        lastDay: DateTime(2050),
        focusedDay: _focusedDay,
        calendarFormat: _calendarFormat,
        onFormatChanged: (format) {
          setState(() {
            _calendarFormat = format;
          });
        },
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          });
        },
        selectedDayPredicate: (day) {
          return isSameDay(day, _selectedDay ?? DateTime.now());
        },
        calendarStyle: const CalendarStyle(
          todayDecoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFAA77FF),
          ),
          selectedDecoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFF97DEFF),
          ),
        ),
      ),
    );
  }
}
