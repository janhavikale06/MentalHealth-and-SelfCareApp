// ignore_for_file: library_private_types_in_public_api

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class StartTrackingButton extends StatefulWidget {
  const StartTrackingButton({Key? key}) : super(key: key);

  @override
  _StartTrackingButtonState createState() => _StartTrackingButtonState();
}

class _StartTrackingButtonState extends State<StartTrackingButton> {
  TimeOfDay? _selectedTime;
  bool isTracking = false;
  DateTime? startTrackingTime;
  DateTime? stopTrackingTime;
  late Timer timer;
  String formattedSleepDuration = '00:00:00';

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    //initializeNotifications();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      updateSleepDuration();
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void checkAlarmTime(TimeOfDay selectedTime) async {
    final Time currentTime =
        Time(DateTime.now().hour, DateTime.now().minute);
    final int timeDifference = selectedTime.hour * 60 +
        selectedTime.minute -
        currentTime.hour * 60 -
        currentTime.minute;

    // Change the condition to check if timeDifference is less than or equal to 0
    if (timeDifference <= 0) {
      await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Alarm',
            style: TextStyle(
              color: Color(0xFFAA77FF),
                fontSize: 20,
              ),
            ),
            content: const Text('Your alarm is ringing!'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK',
                style: TextStyle(
                  color: Color(0xFFAA77FF),
                  fontSize: 16,
                  ),
                ),
              ),
            ],
          );
        },
      );
    }
  }

  Future<void> onSelectNotification(String? payload) async {
    // Handle when the notification is selected
    // For example, to stop the alarm or navigate to a screen
  }

  void updateSleepDuration() {
    if (isTracking && startTrackingTime != null) {
      Duration sleepDuration = DateTime.now().difference(startTrackingTime!);
      formattedSleepDuration = formatDuration(sleepDuration);
      setState(() {});
    }
  }

  Duration calculateSleepDuration() {
    if (startTrackingTime != null && stopTrackingTime != null) {
      return stopTrackingTime!.difference(startTrackingTime!);
    }
    return Duration.zero;
  }

  @override
  Widget build(BuildContext context) {
    String currentTime = DateFormat.Hm().format(DateTime.now());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF97DEFF),
        title: const Text(
          'Start Tracking',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/home_image.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 2, right: 2),
                  child: Container(
                    width: double.infinity,
                    height: 102,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/sleepNight.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'Good Night',
                          style: TextStyle(
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
                            fontSize: 38,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: ElevatedButton(
                            onPressed: () {
                              _selectTime(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 207, 158, 249),
                              elevation: 0,
                              fixedSize: const Size(125, 25),
                            ),
                            child: const Text(
                              'Set Alarm',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (_selectedTime != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      'Alarm Time: ${_selectedTime!.format(context)}',
                      style: const TextStyle(
                        color: Color(0xFFAA77FF),
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.only(top: 140),
                  child: Container(
                    width: 190.0,
                    height: 190.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFFAA77FF).withOpacity(0.3),
                    ),
                    child: Center(
                      child: Text(
                        currentTime,
                        style: const TextStyle(
                          fontSize: 45.0,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              color: Color(0xFF97DEFF),
                              offset: Offset(-1, -1),
                              blurRadius: 7,
                            ),
                          ],
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 120),
                if (isTracking)
                  Text(
                    'Sleep Duration: $formattedSleepDuration',
                    style: const TextStyle(
                      color: Color(0xFFAA77FF),
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                const SizedBox(height: 20),
                if (!isTracking &&
                    stopTrackingTime != null &&
                    startTrackingTime != null)
                  Text(
                    'Sleep Duration: ${formatDuration(calculateSleepDuration())}',
                    style: const TextStyle(
                      color: Color(0xFFAA77FF),
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (isTracking) {
                        stopTrackingTime = DateTime.now();
                      } else {
                        startTrackingTime = DateTime.now();
                      }
                      isTracking = !isTracking;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFAA77FF),
                  ),
                  child: Text(
                    isTracking ? 'Stop Tracking' : 'Start Tracking',
                    style: const TextStyle(fontSize: 20.0),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != TimeOfDay.now()) {
      setState(() {
        _selectedTime = picked;
        checkAlarmTime(_selectedTime!);
      });
    }
  }

  String formatDuration(Duration duration) {
    int hours = duration.inHours;
    int minutes = (duration.inMinutes % 60);
    int seconds = (duration.inSeconds % 60);
    return '$hours:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}
