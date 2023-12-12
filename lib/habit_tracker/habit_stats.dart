import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mental_health/habit_tracker/habit_tracker.dart';

class CompletedHabitsPage extends StatelessWidget {
  final List<DateTime> dates;
  final Map<DateTime, List<Habit>> completedHabitsMap;

  const CompletedHabitsPage({
    Key? key,
    required this.dates,
    required this.completedHabitsMap, required DateTime selectedDate, required List<Habit> completedHabits,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF97DEFF),
        title: const Text(
          'Completed Habits',
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
          Container(
            margin: const EdgeInsets.only(top: kToolbarHeight),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: dates.length,
              itemBuilder: (context, dateIndex) {
                final date = dates[dateIndex];
                final completedHabits = completedHabitsMap[date];

                return Card(
                  color: const Color(0xFF97DEFF),
                  child: ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          DateFormat.E().format(date),
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          DateFormat.yMd().format(date),
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        if (completedHabits != null && completedHabits.isNotEmpty)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: completedHabits
                                .map(
                                  (habit) => Text(
                                    habit.name,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                )
                                .toList(),
                          )
                        else
                          const Text(
                            'No completed habits for this date.',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
