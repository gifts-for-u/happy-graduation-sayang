import 'package:flutter/material.dart';

import 'screens/ar_redirect_screen.dart';
import 'screens/congrats_screen.dart';
import 'screens/gallery_screen.dart';
import 'screens/splash_screen.dart';
import 'theme.dart';

void main() {
  runApp(const GraduationApp());
}

class GraduationApp extends StatelessWidget {
  const GraduationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Happy Graduation',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.buildTheme(),
      home: const SplashScreen(),
      routes: {
        '/gallery': (_) => const GalleryScreen(),
        '/congrats': (_) => const CongratsScreen(),
        '/ar': (_) => const ArRedirectScreen(),
      },
    );
  }
}
