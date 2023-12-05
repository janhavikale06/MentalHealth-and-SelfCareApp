// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
//import 'package:intl/intl.dart';

class MoodTrackerPage extends StatefulWidget {
  const MoodTrackerPage({Key? key}) : super(key: key);

  @override
  _MoodTrackerPageState createState() => _MoodTrackerPageState();
}

class _MoodTrackerPageState extends State<MoodTrackerPage> {
  // Map mood names to their corresponding colors
  Map<String, Color> moodColors = {
    "Happy": Colors.green, // Dark green for Happy
    "Good": Colors.lightGreen, // Light green for Good
    "Neutral": Colors.yellow, // Yellow for Neutral
    "Bad": Colors.orange, // Red for Bad
    "Very Bad": Colors.red, // Black for Very Bad
  };

  DateTime selectedDate = DateTime.now(); // Change to non-nullable DateTime
 // Store the selected date
 // 
  Map<DateTime, String> moodData = {}; // Store mood data for each date

  // List of mood images (you can replace these with your own image assets)
  List<String> moodImages = [
    "assets/images/happy.png",
    "assets/images/okay.png",
    "assets/images/netural.png",
    "assets/images/bad.png",
    "assets/images/very_bad.png",
  ];

  List<String> moodNames = ["Happy", "Good", "Neutral", "Bad", "Very Bad"];

  String formattedDateTime = '';

  @override
  void initState() {
    super.initState();
    _updateDateTime();
  }

  void _updateDateTime() {
    final now = DateTime.now();
    final formattedDate = "${now.day}/${now.month}/${now.year}";
    final formattedTime = "${now.hour}:${now.minute}";
    formattedDateTime = "$formattedDate - $formattedTime";
  }

  // Function to update the selected mood and date
  void _updateSelectedMood(int index) {
    setState(() {
      selectedDate = DateTime.now();
      //final selectedDateStr = selectedDate.toString().split(' ')[0];
      moodData[selectedDate] = moodNames[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF97DEFF),
        title: const Text(
          'Mood Tracker',
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/home_image.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            color: Colors.transparent,
            child: Column(
              children: [
                CalendarWidget(
                  selectedDate: selectedDate,
                  moodData: moodData,
                  moodColors: moodColors,
                ),
                const SizedBox(height: 70),
                const Text(
                  'How are you feeling today?',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFAA77FF),
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
                  ),
                ),
                const SizedBox(height: 13),
                Text(
                  formattedDateTime,
                  style: const TextStyle(
                    fontSize: 17,
                    color: Color(0xFFAA77FF),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(moodImages.length, (index) {
                    return GestureDetector(
                      onTap: () => _updateSelectedMood(index),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(5),
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: moodData[selectedDate] == moodNames[index]
                                  ? const Color(0xFFD8B4F8)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image.asset(
                              moodImages[index],
                              width: 50,
                              height: 50,
                            ),
                          ),
                          Text(
                            moodNames[index],
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFAA77FF),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CalendarWidget extends StatefulWidget {
  final DateTime? selectedDate;
  final Map<DateTime, String> moodData;
  final Map<String, Color> moodColors;

  const CalendarWidget({Key? key, this.selectedDate, required this.moodData, required this.moodColors})
      : super(key: key);

  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}
class _CalendarWidgetState extends State<CalendarWidget> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  final DateTime _focusedDay = DateTime(2023, 12, 5);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 30, right: 30),
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
          // Handle day selection if needed
        },
        selectedDayPredicate: (day) {
          return isSameDay(day, widget.selectedDate ?? DateTime.now());
        },
        calendarStyle: CalendarStyle(
          todayDecoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFAA77FF),
          ),
          selectedDecoration: BoxDecoration(
            shape: BoxShape.circle,
            color: widget.moodData[widget.selectedDate] != null
                ? widget.moodColors[widget.moodData[widget.selectedDate]!]
                : const Color(0xFFAA77FF),
          ),
        ),
        calendarBuilders: CalendarBuilders(
          markerBuilder: (context, day, events) {
            final mood = widget.moodData[day];
            if (mood != null) {
              return Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: widget.moodColors[mood],
                ),
              );
            }
            return null;
          },
        ),
      ),
    );
  }
}

