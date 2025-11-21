import 'package:flutter/material.dart';

import '../widgets/confetti_overlay.dart';
import '../widgets/custom_button.dart';

class CongratsScreen extends StatelessWidget {
  const CongratsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Selamat!')),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'You did it! 🎓',
                  style: textTheme.displayLarge?.copyWith(fontSize: 48),
                ),
                const SizedBox(height: 16),
                Text(
                  'Bangga banget melihat kamu menutup perjalanan kuliahmu dengan senyum. '
                  'Semoga semua mimpi besar berikutnya datang satu per satu. Love you!',
                  style: textTheme.bodyLarge,
                ),
                const SizedBox(height: 32),
                CustomButton(
                  label: 'Lanjut Lihat Galeri',
                  icon: Icons.arrow_forward_rounded,
                  onPressed: () => Navigator.pushReplacementNamed(context, '/gallery'),
                ),
              ],
            ),
          ),
          const ConfettiOverlay(),
        ],
      ),
    );
  }
}
