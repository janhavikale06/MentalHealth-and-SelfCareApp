// ignore_for_file: library_private_types_in_public_api, await_only_futures, use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mental_health/mood_tracker/mood_stats.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';

class MoodTrackerPage extends StatefulWidget {
   final Map<DateTime, String> moodData;

  const MoodTrackerPage({Key? key, required this.moodData}) : super(key: key);

  @override
  _MoodTrackerPageState createState() => _MoodTrackerPageState();
}

class _MoodTrackerPageState extends State<MoodTrackerPage> {

  late List<String> moodLabels;
  late List<DateTime> dates;
  late SharedPreferences prefs;

  Map<String, Color> moodColors = {
    "Happy": Colors.green,
    "Good": Colors.lightGreen,
    "Neutral": Colors.yellow,
    "Bad": Colors.orange,
    "Very Bad": Colors.red,
  };

  DateTime selectedDate = DateTime.now();
  Map<DateTime, String> moodData = {};
  List<String> moodImages = [
    "assets/images/very_bad.png",
    "assets/images/bad.png",
    "assets/images/neutral.png",
    "assets/images/okay.png",
    "assets/images/happy.png",
  ];
  List<String> moodNames = ["Very Bad", "Bad", "Neutral", "Good", "Happy"];
  String formattedDateTime = '';

  void _updateSelectedMood(int index) {
    setState(() {
      moodData = {...moodData};
      final selectedMood = moodNames[index];

      // Increment mood count
      final moodCount = _countMoods();
      moodCount[selectedMood] = (moodCount[selectedMood] ?? 0) + 1;

      // Save updated mood count data
      _saveMoodCountData(moodCount);

      // Update selected date based on index
      final previousDay = selectedDate.subtract(const Duration(days: 1));
      final nextDay = selectedDate.add(const Duration(days: 1));

      if (index > 0 && !moodData.containsKey(previousDay)) {
        // Navigating to previous day's mood
        moodData[previousDay] = moodNames[index - 1];
        selectedDate = previousDay;
      } else if (index < moodNames.length - 1 && !moodData.containsKey(nextDay)) {
        // Navigating to next day's mood
        moodData[nextDay] = moodNames[index + 1];
        selectedDate = nextDay;
      }
      // Update the mood of the selected day
      moodData[selectedDate] = selectedMood;
    });
  }


  void _navigateToMoodStatsPage() async {
    Map<String, int> moodCounts = _countMoods(); // Get mood counts
    await _saveMoodCountData(moodCounts); // Save mood counts before navigating
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MoodStatsPage(moodCounts: moodCounts),
      ),
    );
  }

  Map<String, int> _countMoods() {
    Map<String, int> moodCount = {
      "Very Bad": 0,
      "Bad": 0,
      "Neutral": 0,
      "Good": 0,
      "Happy": 0,
    };

    for (var mood in widget.moodData.values) {
      moodCount[mood] = (moodCount[mood] ?? 0) + 1;
    }
    return moodCount;
  }

  @override
  void initState() {
    super.initState();
    _updateDateTime();
    _initializeSharedPreferences();

    // Initialize moodLabels and dates here using widget.moodData
    moodLabels = widget.moodData.entries.map((entry) => entry.value).toList();
    dates = widget.moodData.keys.toList();
  }

  void _initializeSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
    _loadMoodData();
  }

  void _loadMoodData() {
    final String jsonData = prefs.getString('moodData') ?? '{}';
    final Map<String, dynamic> savedData = json.decode(jsonData);
    setState(() {
      moodData = savedData.map((key, value) => MapEntry(DateTime.parse(key), value));
    });
  }

  Future<void> _saveMoodCountData(Map<String, int> moodCount) async {
    final jsonData = json.encode(moodCount);
    await prefs.setString('moodCountData', jsonData);
  }


  void _updateDateTime() {
    final now = DateTime.now();
    final formattedDate = "${now.day}/${now.month}/${now.year}";
    final formattedTime = "${now.hour}:${now.minute}";
    formattedDateTime = "$formattedDate - $formattedTime";
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
                  onDaySelected: (day) {
                    setState(() {
                      selectedDate = day;
                    });
                  },
                ),
                const SizedBox(height: 50),
                const Text(
                  'How are you feeling today?',
                  style: TextStyle(
                    fontSize: 29,
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
                const SizedBox(height: 10),
                Text(
                  formattedDateTime,
                  style: const TextStyle(
                    fontSize: 17,
                    color: Color(0xFFAA77FF),
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(moodImages.length, (index) {
                    return GestureDetector(
                      onTap: () => _updateSelectedMood(index),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(3.5),
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
                const SizedBox(height: 20),
                Align(
  alignment: Alignment.center,
  child: ElevatedButton(
    onPressed: () {
      int index = 0;
      _updateSelectedMood(index);
      _navigateToMoodStatsPage(); // Move the navigation here
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFFAA77FF),
      minimumSize: const Size(78, 32),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      side: const BorderSide(color: Color(0xFFAA77FF), width: 2),
    ),
    child: const Text(
      'Save',
      style: TextStyle(fontSize: 20, color: Colors.white),
    ),
  ),
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
  final ValueChanged<DateTime>? onDaySelected;

  const CalendarWidget({
    Key? key,
    this.selectedDate,
    required this.moodData,
    required this.moodColors,
    this.onDaySelected,
  }) : super(key: key);

  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
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
          widget.onDaySelected?.call(selectedDay);
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
            color: widget.moodData[widget.selectedDate ?? DateTime.now()] != null
                ? widget.moodColors[widget.moodData[widget.selectedDate ?? DateTime.now()]!]
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
        onPageChanged: (focusedDay) {
          setState(() {
            _focusedDay = focusedDay;
          });
        },
      ),
    );
  }
}