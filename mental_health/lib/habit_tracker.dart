// ignore_for_file: must_be_immutable, unused_field

import 'package:flutter/material.dart';
import 'package:calendar_agenda/calendar_agenda.dart';

class Habit {
  final String name;
  Habit(this.name);
}

class HabitTrackerPage extends StatefulWidget {
  List<Habit> habits = []; 
  HabitTrackerPage({Key? key, required Null Function(List<Habit> updatedHabits) updateHabits}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HabitTrackerPageState createState() => _HabitTrackerPageState();
}


class _HabitTrackerPageState extends State<HabitTrackerPage> {
  late TextEditingController habitController;
  List<List<String>> habitsData = List.generate(7, (index) => <String>[]);
  List<List<bool>> habitDoneData = List.generate(7, (index) => <bool>[]);

  int counter = 0;
  late DateTime _selectedDateAppBBar;
  int selectedDayIndex = DateTime.now().weekday - 1;
  final CalendarAgendaController _calendarAgendaControllerAppBar = CalendarAgendaController();

  @override
  void initState() {
    super.initState();
    habitController = TextEditingController();
    _selectedDateAppBBar = DateTime.now();
  }

  
   void addHabit(String habitName) {
    final newHabit = Habit(habitName);
    setState(() {
      widget.habits.add(newHabit); // Add the new habit to the list
    });
  }


  // Function to update the counter based on completed habits
  int getCounter() {
    return habitDoneData[selectedDayIndex].where((habitDone) => habitDone).length;
  }

  @override
  Widget build(BuildContext context) {
    int counter = getCounter(); // Update the counter here

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
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/home_image.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Column(
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
                "You have ${habitsData[selectedDayIndex].length - counter} habits left for today",
                style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFAA77FF),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.all(8.0),
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
                              "${habitsData[selectedDayIndex].isNotEmpty ? ((counter / habitsData[selectedDayIndex].length) * 100).round() : 0}%",
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
                                ? (counter / habitsData[selectedDayIndex].length)
                                : 0.0,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Divider(),
                      ),
                       SizedBox(
                    child: SingleChildScrollView( // Wrap the ListView.builder with SingleChildScrollView
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: habitsData[selectedDayIndex].length,
                        itemBuilder: (context, int index) {
                          return ListTile(
                            title: Text(habitsData[selectedDayIndex][index]),
                            leading: Checkbox(
                              value: habitDoneData[selectedDayIndex][index],
                              onChanged: (bool? newValue) {
                                setState(() {
                                  if (newValue == false) {
                                    counter -= 1;
                                  } else {
                                    counter += 1;
                                  }
                                  habitDoneData[selectedDayIndex][index] = newValue ?? false;
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
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
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
                  habitsData[selectedDayIndex].add(newHabitName);
                  habitDoneData[selectedDayIndex].add(false); // Initialize as not done
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
