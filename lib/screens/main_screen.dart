import 'package:flutter/material.dart';

import '../theme.dart';
import '../widgets/custom_button.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Happy Graduation, Sayang!',
                style: textTheme.displayLarge?.copyWith(fontSize: 40),
              ),
              const SizedBox(height: 16),
              Text(
                'Rayakan pencapaianmu dengan galeri kenangan dan kejutan kecil dari aku. '
                'Swipe, senyum, dan rasakan cinta di setiap slide.',
                style: textTheme.bodyLarge,
              ),
              const SizedBox(height: 32),
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      label: 'Lihat Galeri',
                      icon: Icons.photo_library_rounded,
                      onPressed: () => Navigator.pushNamed(context, '/gallery'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: CustomButton(
                      label: 'Coba Filter AR',
                      icon: Icons.filter_vintage_rounded,
                      onPressed: () => Navigator.pushNamed(context, '/ar'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Center(
                child: TextButton(
                  onPressed: () => Navigator.pushNamed(context, '/congrats'),
                  child: Text(
                    'Lihat ucapan spesial →',
                    style: textTheme.bodyLarge?.copyWith(
                      color: AppTheme.midnight,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
