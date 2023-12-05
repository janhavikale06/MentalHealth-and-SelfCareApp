import 'package:flutter/material.dart';
import 'package:mental_health/splash.dart';
import 'package:provider/provider.dart';
import 'package:mental_health/know_more_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProfileProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter UI',
        theme: ThemeData(),
        home: const Splash(),
      ),
    );
  }
}
