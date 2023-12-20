// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PotteryPage extends StatefulWidget {
  const PotteryPage({Key? key}) : super(key: key);

  @override
  _PotteryPageState createState() => _PotteryPageState();
}

class _PotteryPageState extends State<PotteryPage> {
  late String videoId = 'zsoMAHhHaHU'; // YouTube video ID

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFD8B4F8),
        title: const Text(
          'Pottery Page',
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/home_image.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                height: 220,
                child: Image.asset(
                  'assets/images/pottery.png',
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Pottery Making',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
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
                        color: Color(0xFFAA77FF),
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'For the release of emotions and nonverbal communication, pottery making is an effective art therapy practice.'
                      ' Empathy, attentiveness, and a feeling of success are all encouraged by the procedure, which raises self-esteem.'
                      'In the therapeutic domain of art, it provides a tangible sensation of control, promotes reflection, enhances focus, and functions as a metaphor for self-improvement.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18.5,
                        color: Color(0xFFAA77FF),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: 360,
                      height: 1,
                      color: const Color(0xFFAA77FF),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Demo Video',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 26,
                        color: Color(0xFFAA77FF),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // Wrap YoutubePlayer in a Container with a fixed height
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 200,
                      child: YoutubePlayer(
                        controller: YoutubePlayerController(
                          initialVideoId: videoId,
                          flags: const YoutubePlayerFlags(
                            autoPlay: false,
                          ),
                        ),
                        showVideoProgressIndicator: true,
                        progressIndicatorColor: Colors.amber,
                        // Adding Play/Pause icons
                        actionsPadding: EdgeInsets.zero, // To align icons to the left
                        bottomActions: [
                          CurrentPosition(), // Displays the current position
                          const SizedBox(width: 10),
                          PlayPauseButton(), // Play/Pause button
                          const SizedBox(width: 10),
                          ProgressBar(isExpanded: true),
                          RemainingDuration(), // Displays the remaining duration
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
