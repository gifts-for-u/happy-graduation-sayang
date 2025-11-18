import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/custom_button.dart';

class ArRedirectScreen extends StatelessWidget {
  const ArRedirectScreen({super.key});

  Future<void> _openFilter() async {
    final url = Uri.parse('https://www.tiktok.com/@youruser/effect/xxxxxxxx');
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Coba Filter AR')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: CustomButton(
            label: 'Buka TikTok Filter',
            icon: Icons.play_circle_rounded,
            onPressed: _openFilter,
          ),
        ),
      ),
    );
  }
}
