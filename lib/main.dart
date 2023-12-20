// ignore_for_file: library_prefixes, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:mental_health/login_pages/sign_in.dart';
import 'package:mental_health/login_pages/splash.dart' as SplashPage;
import 'package:mental_health/profile/personal_details.dart';
import 'package:mental_health/survey/know_more_page.dart';
import 'package:provider/provider.dart';
import 'package:mental_health/survey/know_more_page.dart' as KnowMorePage;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => KnowMorePage.UserProfileProvider(),
        ),
      ],
      child: Consumer<UserProfileProvider>(
        builder: (context, userProfileProvider, _) {
          final userProfile = userProfileProvider.userProfile;

          return MaterialApp(
            initialRoute: '/',
            routes: {
              '/personal_details': (context) => userProfile != null
                  ? PersonalDetailsPage(userProfile: userProfile,  profilePhotoPath: '',)
                  : const Scaffold(
                      body: Center(
                        child: Text('User data not available'),
                      ),
                    ),
              '/login': (context) => SignIn(),
            },
            debugShowCheckedModeBanner: false,
            title: 'Flutter UI',
            theme: ThemeData(),
            home: const SplashPage.Splash(),
          );
        },
      ),
    );
  }
}
