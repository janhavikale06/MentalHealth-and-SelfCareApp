// ignore_for_file: camel_case_types, library_private_types_in_public_api

import 'package:flutter/material.dart';

class getfit extends StatefulWidget {
  const getfit({Key? key}) : super(key: key);

  @override
  _getfit createState() => _getfit();
}

class _getfit extends State<getfit> {
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
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
