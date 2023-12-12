// ignore_for_file: library_prefixes

import 'package:flutter/material.dart';
import 'package:mental_health/login_pages/splash.dart' as SplashPage;
import 'package:provider/provider.dart';
import 'package:mental_health/survey/know_more_page.dart' as KnowMorePage;

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
          create: (_) => KnowMorePage.UserProfileProvider(),
        ),
      ],
      
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter UI',
        theme: ThemeData(),
        home: const SplashPage.Splash(),
      ),
    );
  }
}
