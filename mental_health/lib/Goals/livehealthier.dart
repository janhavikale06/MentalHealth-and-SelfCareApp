// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class LiveHealthier extends StatefulWidget {
  const LiveHealthier({Key? key}) : super(key: key);

  @override
  _LiveHealthier createState() => _LiveHealthier();
}

class _LiveHealthier extends State<LiveHealthier> {
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
        ],
      ),
    );
              
  }
}
