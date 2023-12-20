// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class GardeningPage extends StatefulWidget {
  const GardeningPage({Key? key}) : super(key: key);

  @override
  _GardeningPage createState() => _GardeningPage();
}

class _GardeningPage extends State<GardeningPage> {

  late String videoId = 'M8qIDrbP5HQ'; //YouTube video ID
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFD8B4F8), // Custom AppBar color
        title: const Text(
          'Gradening Page',
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
      ),
      body: Container(
        constraints: const BoxConstraints.expand(), // Expand the container to fill the entire screen
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
                height: 220, // Adjust the height of the image
                child: Image.asset(
                  'assets/images/gardening.png',
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Gardening',
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
                      'Tending a garden cultivates awareness, eases tension, and improves general health.'
                      ' It develops self-expression, a sense of accomplishment, and a bond with the natural world.'
                      ' With its calming properties and healing meaning, gardening fosters interpersonal development and'
                      ' ties to the community. It transforms into a comprehensive practice for mental health and self-care'
                      ' when incorporated into a larger art therapy strategy.',
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
  