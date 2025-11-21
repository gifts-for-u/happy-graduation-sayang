import 'package:flutter/material.dart';

import '../theme.dart';
import '../widgets/custom_button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: AppTheme.blushPink,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Halo sayangg, Happy Graduation for Youu❣️',
                textAlign: TextAlign.center,
                style: textTheme.displayLarge?.copyWith(fontSize: 32),
              ),
              const SizedBox(height: 32),
              CustomButton(
                label: 'Mulai lihat hadiah',
                icon: Icons.arrow_forward_rounded,
                onPressed: () => Navigator.pushReplacementNamed(context, '/main'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
