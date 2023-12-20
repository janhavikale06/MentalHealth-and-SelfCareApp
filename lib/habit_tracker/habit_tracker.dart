// ignore_for_file: must_be_immutable, unused_field, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:calendar_agenda/calendar_agenda.dart';
import 'package:mental_health/habit_tracker/habit_stats.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Habit {
  final String name;
  bool isChecked;

  Habit(this.name, this.isChecked);
}

class HabitTrackerPage extends StatefulWidget {
  final Null Function(List<Habit> updatedHabits) updateHabits;
  List<Habit> habits = [];

  HabitTrackerPage({Key? key, required this.updateHabits}) : super(key: key);

  @override
  _HabitTrackerPageState createState() => _HabitTrackerPageState();
}

class _HabitTrackerPageState extends State<HabitTrackerPage> {
  late TextEditingController habitController;
  List<List<Habit>> habitsData = List.generate(7, (index) => <Habit>[]);
  int counter = 0;
  late DateTime _selectedDateAppBBar;
  int selectedDayIndex = DateTime.now().weekday - 1;
  final CalendarAgendaController _calendarAgendaControllerAppBar =
      CalendarAgendaController();

  @override
  void initState() {
    super.initState();
    habitController = TextEditingController();
    _selectedDateAppBBar = DateTime.now();
    loadHabitsData();
  }

  void addHabit(String habitName, bool isChecked) {
    final newHabit = Habit(habitName, isChecked);
    setState(() {
      widget.habits.add(newHabit);
      habitsData[selectedDayIndex].add(newHabit);
      saveHabitsData();
    });
  }

  int getCounter() {
    return habitsData[selectedDayIndex].where((habit) => habit.isChecked).length;
  }

  void removeHabit(int index) {
    setState(() {
      habitsData[selectedDayIndex].removeAt(index);
      saveHabitsData();
    });
  }

  void loadHabitsData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? habitsJson = prefs.getStringList('habitsData');
    if (habitsJson != null) {
      List<List<Map<String, dynamic>>> decodedData = habitsJson
          .map((json) => List<Map<String, dynamic>>.from(jsonDecode(json)))
          .toList();
      habitsData = decodedData
          .map((list) =>
              list.map((map) => Habit(map['name'], map['isChecked'])).toList())
          .toList();
    }
  }

  void saveHabitsData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> habitsJson = habitsData
        .map((list) =>
            jsonEncode(list.map((habit) => habit.toJson()).toList()))
        .toList();
    prefs.setStringList('habitsData', habitsJson);
  }

  // Navigating to CompletedHabitsPage
  void navigateToCompletedHabitsPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CompletedHabitsPage(
          selectedDate: _selectedDateAppBBar, completedHabits: const [], dates: const [], completedHabitsMap: const {},
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int completedCounter = getCounter();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF97DEFF),
        title: const Text(
          'Habit Tracker',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
      ),
      body: Container(
        // Adjust the decoration and child dimensions to cover the entire screen
        height: MediaQuery.of(context).size.height, // Set the height to the screen's height
        width: double.infinity, // Take up the full width
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/home_image.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              CalendarAgenda(
                controller: _calendarAgendaControllerAppBar,
                selectedDayPosition: SelectedDayPosition.center,
                weekDay: WeekDay.short,
                dayNameFontSize: 15,
                dayNumberFontSize: 18,
                dayBGColor: const Color(0xFF97DEFF).withOpacity(0.40),
                monthColor: const Color(0xFFAA77FF),
                titleSpaceBetween: 15,
                backgroundColor: Colors.transparent,
                fullCalendarScroll: FullCalendarScroll.horizontal,
                fullCalendarDay: WeekDay.short,
                selectedDateColor: const Color(0xFFAA77FF),
                dateColor: Colors.white,
                locale: 'en',
                initialDate: DateTime.now(),
                firstDate: DateTime.now().subtract(const Duration(days: 140)),
                lastDate: DateTime.now().add(const Duration(days: 60)),
                onDateSelected: (date) {
                  setState(() {
                    _selectedDateAppBBar = date;
                    selectedDayIndex = date.weekday - 1;
                  });
                },
                selectedDayLogo: Container(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  decoration: BoxDecoration(
                    color: const Color(0xFF97DEFF).withOpacity(0.55),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "You have $completedCounter habits completed for today",
                style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFAA77FF),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  padding: const EdgeInsets.all(5),
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Keep Going !",
                              style: TextStyle(color: Colors.grey[600], fontSize: 17),
                            ),
                            Text(
                              "${habitsData[selectedDayIndex].isNotEmpty ? ((completedCounter / habitsData[selectedDayIndex].length) * 100).round() : 0}%",
                              style: TextStyle(color: Colors.grey[600], fontSize: 17),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.85,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          child: LinearProgressIndicator(
                            minHeight: 12,
                            color: const Color(0xFFAA77FF),
                            backgroundColor: const Color(0xFFD8B4F8),
                            value: (habitsData[selectedDayIndex].isNotEmpty)
                                ? (completedCounter / habitsData[selectedDayIndex].length)
                                : 0.0,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Divider(),
                      ),
                      SizedBox(
                        child: SingleChildScrollView(
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            itemCount: habitsData[selectedDayIndex].length,
                            itemBuilder: (context, int index) {
                              return ListTile(
                                title: Row(
                                  children: [
                                    Expanded(
                                      child: Text(habitsData[selectedDayIndex][index].name),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        removeHabit(index);
                                      },
                                      icon: const Icon(
                                        Icons.delete_outline,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                                leading: Checkbox(
                                  value: habitsData[selectedDayIndex][index].isChecked,
                                  onChanged: (bool? newValue) {
                                    setState(() {
                                      if (newValue == true) {
                                        completedCounter += 1;
                                      } else {
                                        completedCounter -= 1;
                                      }
                                      habitsData[selectedDayIndex][index].isChecked = newValue ?? false;
                                      saveHabitsData();
                                    });
                                  },
                                  activeColor: const Color(0xFFAA77FF),
                                  checkColor: Colors.white,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 70,
                        child: ElevatedButton(
                          onPressed: () {
                            // Navigate to the Profile page when the "Save" button is pressed
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => CompletedHabitsPage(selectedDate: _selectedDateAppBBar, completedHabits: habitsData[selectedDayIndex], dates: const [], completedHabitsMap: const {},)),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFAA77FF),
                            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          ),
                          child: const Text(
                            'Save',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddHabitDialog(context);
        },
        backgroundColor: const Color(0xFFAA77FF),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  void showAddHabitDialog(BuildContext context) {
    String newHabitName = "";

    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController habitNameController = TextEditingController(text: newHabitName);

        return AlertDialog(
          backgroundColor: const Color(0xFFD8B4F8),
          title: const Text(
            "Add a Habit",
            style: TextStyle(color: Color(0xFFAA77FF), fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: habitNameController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: "Habit Name",
                  labelStyle: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(const Color(0xFFAA77FF)),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Cancel",
                style: TextStyle(color: Colors.white),
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(const Color(0xFFAA77FF)),
              ),
              onPressed: () {
                setState(() {
                  newHabitName = habitNameController.text;

                  // Add the new habit to your data structures
                  addHabit(newHabitName, false); // Initialize as not done
                });
                Navigator.pop(context);
              },
              child: const Text(
                "Save",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    habitController.dispose();
    super.dispose();
  }
}

extension HabitExtension on Habit {
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'isChecked': isChecked,
    };
  }
}
