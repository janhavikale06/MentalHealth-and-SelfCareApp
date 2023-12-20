// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PaintingPage extends StatefulWidget {
  const PaintingPage({Key? key}) : super(key: key);

  @override
  _PaintingPage createState() => _PaintingPage();
}

class _PaintingPage extends State<PaintingPage> {

  late String videoId = 'mq-rUMpHBeo'; //YouTube video ID
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFD8B4F8), // Custom AppBar color
        title: const Text(
          'Painting Page',
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
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
                height: 210,
                child: Image.asset(
                  'assets/images/painting.png', 
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Painting',
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
                      'As a creative release and meditation technique, painting is a highly effective art therapy method that supports mental health and self-care.'
                      ' As people investigate and understand their sensations, it improves focus, relaxation, and self-worth.'
                      ' Painting is a cathartic release that gives voice to people who have trouble communicating verbally.'
                      ' It also improves problem-solving skills, cognitive flexibility, and the mind-body connection.',
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
                    SingleChildScrollView(
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




