// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:mental_health/Goals/badhabits.dart';
import 'package:mental_health/Goals/getfit.dart';
import 'package:mental_health/Goals/livehealthier.dart';
import 'package:mental_health/Goals/reducestress.dart';
import 'package:mental_health/Goals/selfgrowth.dart';

class CreateGoal extends StatefulWidget {
  const CreateGoal({Key? key}) : super(key: key);

  @override
  _CreateGoal createState() => _CreateGoal();
}

class _CreateGoal extends State<CreateGoal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF97DEFF),
        title: const Text(
          'Goals',
          style: TextStyle(color: Colors.white, fontSize: 22),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom:10),
                  child: Container(
                    width: double.infinity,
                    height: 142,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/trackerHome.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        '    Go for it,\n  goal setter!',
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
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height:10),
                // Rectangle Button with Row
                Padding(
                  padding:const EdgeInsets.only(left:18, right:18),
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to the next page
                      // Replace the following line with your navigation logic
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const LiveHealthier()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 195, 236, 255),
                      padding: const EdgeInsets.all(20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Row(
                      children: [
                        // 1st Column - Image
                        Image.asset(
                          'assets/images/livehealth.png', // Replace with your image path
                          height: 80,
                          width: 110,
                        ),
                        const SizedBox(width: 18),
                        // 2nd Column - Texts
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Live Healthier',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFAA77FF),
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'See Details',
                              style: TextStyle(
                                fontSize: 15,
                                color: Color(0xFFD8B4F8),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                // Rectangle Button with Row
              Padding(
                  padding:const EdgeInsets.only(left:18, right:18),
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to the next page
                      // Replace the following line with your navigation logic
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const GetFit()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.all(20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                
                  child: Row(
                    children: [
                      // 1st Column - Image
                      Image.asset(
                        'assets/images/getfit.png', // Replace with your image path
                        height: 80,
                        width: 110,
                      ),
                      const SizedBox(width: 18),
                      // 2nd Column - Texts
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Get Fit',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFAA77FF),
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'See Details',
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xFFD8B4F8),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              // Rectangle Button with Row
              Padding(
                  padding:const EdgeInsets.only(left:18, right:18),
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to the next page
                      // Replace the following line with your navigation logic
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>const reduceStress()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 195, 236, 255),
                      padding: const EdgeInsets.all(20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                
                  child: Row(
                    children: [
                      // 1st Column - Image
                      Image.asset(
                        'assets/images/reducestress.png', // Replace with your image path
                        height: 80,
                        width: 110,
                      ),
                      const SizedBox(width: 18),
                      // 2nd Column - Texts
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Reduce Stress',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFAA77FF),
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'See Details',
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xFFD8B4F8),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              // Rectangle Button with Row
              Padding(
                  padding:const EdgeInsets.only(left:18, right:18),
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to the next page
                      // Replace the following line with your navigation logic
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>const selfGrowth()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.all(20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                
                  child: Row(
                    children: [
                      // 1st Column - Image
                      Image.asset(
                        'assets/images/selfgrowth.png', // Replace with your image path
                        height: 80,
                        width: 110,
                      ),
                      const SizedBox(width: 18),
                      // 2nd Column - Texts
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Self-Growth',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFAA77FF),
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'See Details',
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xFFD8B4F8),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              // Rectangle Button with Row
              Padding(
                  padding:const EdgeInsets.only(left:18, right:18),
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to the next page
                      // Replace the following line with your navigation logic
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const badhabits()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 195, 236, 255),
                      padding: const EdgeInsets.all(20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                
                  child: Row(
                    children: [
                      // 1st Column - Image
                      Image.asset(
                        'assets/images/badhabits.png', // Replace with your image path
                        height: 80,
                        width: 110,
                      ),
                      const SizedBox(width: 18),
                      // 2nd Column - Texts
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Break Bad Habits',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFAA77FF),
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'See Details',
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xFFD8B4F8),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
