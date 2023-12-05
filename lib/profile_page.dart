import 'package:mental_health/know_more_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fl_chart/fl_chart.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<String> profilePhotos = [
    'assets/images/profile1.png',
    'assets/images/profile2.png',
    'assets/images/profile3.png',
    'assets/images/profile4.png',
    'assets/images/profile5.png',
    'assets/images/profile6.png',
    'assets/images/profile7.png',
    'assets/images/profile8.png',
  ];

  int selectedPhotoIndex = 0;

  Future<void> _showImageSelectionDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Profile Photo'),
          content: SingleChildScrollView(
            child: ListBody(
              children: profilePhotos.asMap().entries.map((entry) {
                final index = entry.key;
                final imagePath = entry.value;
                return ListTile(
                  title: Image.asset(
                    imagePath,
                    width: 50,
                    height: 50,
                  ),
                  onTap: () {
                    setState(() {
                      selectedPhotoIndex = index;
                    });
                    Navigator.of(context).pop();
                  },
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final userProfile = context.watch<UserProfileProvider>().userProfile;

    if (userProfile == null) {
      return const Scaffold(
        body: Center(
          child: Text('User data not available'),
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/home_image.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 65.0, 0, 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _showImageSelectionDialog(context);
                      },
                      child: CircleAvatar(
                        radius: 70,
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage(profilePhotos[selectedPhotoIndex]),
                      ),
                    ),
                    const SizedBox(width: 25),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Name: ${userProfile.name}', style: const TextStyle(fontSize: 16, color: Color(0xFFAA77FF))),
                          Text('Age: ${userProfile.age}', style: const TextStyle(fontSize: 16, color: Color(0xFFAA77FF))),
                          Text('Gender: ${userProfile.gender}', style: const TextStyle(fontSize: 16, color: Color(0xFFAA77FF))),
                          Text('Location: ${userProfile.location}', style: const TextStyle(fontSize: 16, color: Color(0xFFAA77FF))),
                          Text('Work Status: ${userProfile.workStatus}', style: const TextStyle(fontSize: 16, color: Color(0xFFAA77FF))),
                          Text('Marital Status: ${userProfile.maritalStatus}', style: const TextStyle(fontSize: 16, color: Color(0xFFAA77FF))),
                          Text('Goals: ${userProfile.goals}', style: const TextStyle(fontSize: 16, color: Color(0xFFAA77FF))),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20), // Add spacing between profile info and graph
              const Text('Mood Tracking Dashboard', style: TextStyle(fontSize: 20, color: Color(0xFFAA77FF))),
              const SizedBox(
                height: 220,
                child: MoodTrackingDashboard(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MoodTrackingDashboard extends StatelessWidget {
  const MoodTrackingDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<FlSpot> moodData = [
      const FlSpot(0, 3),
      const FlSpot(1, 2),
      const FlSpot(2, 4.5),
      const FlSpot(3, 0.5),
      const FlSpot(4, 4),
      const FlSpot(5, 2),
      const FlSpot(5.6, 0),
    ];

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          const SizedBox(height: 20),
          SizedBox(
            height: 180,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(show: false),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: SideTitles(
                    showTitles: true,
                    margin: 10,
                    getTextStyles: (context, value) => const TextStyle(
                      color: Color(0xff68737d),
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                    getTitles: (value) {
                      switch (value.toInt()) {
                        case 0:
                          return 'Mon';
                        case 1:
                          return 'Tue';
                        case 2:
                          return 'Wed';
                        case 3:
                          return 'Thu';
                        case 4:
                          return 'Fri';
                        case 5:
                          return 'Sat';
                        case 6:
                          return 'Sun';
                        default:
                          return '';
                      }
                    },
                  ),
                  leftTitles: SideTitles(
                    showTitles: true,
                    margin: 10,
                    getTextStyles: (context, value) => const TextStyle(
                      color: Color(0xff67727d),
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                    getTitles: (value) {
                      switch (value.toInt()) {
                        case 0:
                          return 'Sad';
                        case 1:
                          return 'Happy';
                        case 2:
                          return 'Neutral';
                        case 3:
                          return 'Angry';
                        case 4:
                          return 'Stressed';
                        case 5:
                          return 'Exhausted';
                        case 6:
                          return 'Calm';
                        default:
                          return '';
                      }
                    },
                  ),
                ),
                borderData: FlBorderData(
                  show: true,
                  border: Border.all(
                    color: const Color(0xff37434d),
                    width: 0,
                  ),
                ),
                minX: 0,
                maxX: 6,
                minY: 0,
                maxY: 5,
                lineBarsData: [
                  LineChartBarData(
                    spots: moodData,
                    isCurved: true,
                    colors: [const Color(0xFFAA77FF)],
                    dotData: FlDotData(show: false),
                    belowBarData: BarAreaData(show: false),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}



