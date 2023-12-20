// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class OpenSharedCircle extends StatefulWidget {
  const OpenSharedCircle({Key? key}) : super(key: key);

  @override
  _OpenSharedCircleState createState() => _OpenSharedCircleState();
}

class _OpenSharedCircleState extends State<OpenSharedCircle> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF97DEFF),
        title: const Text(
          'Open Sharing Circle',
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/home_image.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                height: 180,
                child: Image.asset(
                  'assets/images/openshare.png',
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 195, 236, 255),
                    border: Border.all(color: const Color(0xFF97DEFF), width: 2),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: const Text(
                    'Keeping grudges increases stress and negative self-talk.'
                    ' Watch inspirational movies on stress, anxiety, and productivity.'
                    ' Take part in interactive short films to exchange experiences,'
                    ' which will lower stress and increase productivity.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.7,
                      color: Color(0xFFAA77FF),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'Session Videos',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 27,
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
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height:5),
              Stack(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildVideoContainer(
                          'How to manage stress',
                          'Clinging to our issues will make us suffer\nmore. A professor gives pupils important\nlife lessonsin this inspirational tale about\nstress management. \n',
                          'X3wi1I_2cR4',
                        ),
                        _buildVideoContainer(
                          'Overcomer Animated Short',
                          'Even through the darkest times, these films\npositively impact anxiety, stress,\nand depression.',
                          'V6ui161NyTg',
                        ),
                        _buildVideoContainer(
                          'The Secret To unlocking\nyour potential',
                          'Motivational Speech To Improve Your Productivity.',
                          'IU-e5P3F_uY',
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 3,
                    top: 130,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_left),
                      onPressed: () {
                        _pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                    ),
                  ),
                  Positioned(
                    right: 5,
                    top: 130,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_right),
                      onPressed: () {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVideoContainer(
    String title,
    String description,
    String youtubeVideoId,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 15),
          SizedBox(
            width: 275,
            height: 168, // Adjust the height as needed
            child: YoutubePlayer(
              controller: YoutubePlayerController(
                initialVideoId: youtubeVideoId,
                flags: const YoutubePlayerFlags(
                  autoPlay: false,
                ),
              ),
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.white,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFFAA77FF)),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 8),
            child: Text(
              description,
              style: const TextStyle(fontSize: 16, color: Color(0xFFAA77FF)),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
