import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mental_health/habit_tracker/habit_tracker.dart';

class CompletedHabitsPage extends StatelessWidget {
  final List<DateTime> dates;
  final Map<DateTime, List<Habit>> completedHabitsMap;

  const CompletedHabitsPage({
    Key? key,
    required this.dates,
    required this.completedHabitsMap, required DateTime selectedDate, required List completedHabits,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFD8B4F8),
        title: const Text(
          'Completed Habits',
          style: TextStyle(color: Colors.white, fontSize: 22),
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
        child: completedHabitsMap.isEmpty || dates.isEmpty
            ? const Center(
                child: Text('No completed habits found.'),
              )
            : ListView.builder(
                itemCount: dates.length,
                itemBuilder: (context, index) {
                  final date = dates[index];
                  final completedHabits = completedHabitsMap[date];
                  return Card(
                    child: ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            DateFormat.yMMMd().format(date),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: completedHabits!
                                .map(
                                  (habit) => Text(
                                    habit.name, // Display habit name
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                )
                              .toList(),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
