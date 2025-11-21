import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/memory.dart';
import '../utils/memories_loader.dart';
import '../widgets/custom_button.dart';
import '../widgets/photo_card.dart';
import 'congrats_screen.dart';

class MemoriesProvider with ChangeNotifier {
  MemoriesProvider() {
    _load();
  }

  List<Memory>? _memories;
  bool _loading = true;

  List<Memory>? get memories => _memories;
  bool get loading => _loading;

  Future<void> _load() async {
    _memories = await MemoriesLoader.loadMemories();
    _loading = false;
    notifyListeners();
  }
}

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  int _current = 0;
  bool _isLastPage = false;

  @override
  Widget build(BuildContext context) {
    // Adjust these values to change the size of the cards
    const double cardHeightFactor = 0.7;
    const double cardViewportFraction = 1.0;
    // To change the button color, modify this color value.
    // You can use any color from the `Colors` class, like `Colors.blue`,
    // or define a custom color with `Color(0xFFRRGGBB)`.
    const Color buttonColor = Colors.pinkAccent;

    return ChangeNotifierProvider(
      create: (_) => MemoriesProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Kenangan Kita'),
        ),
        body: Consumer<MemoriesProvider>(
          builder: (context, provider, _) {
            if (provider.loading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (provider.error != null) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    provider.error!,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: Theme.of(context).colorScheme.error),
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            }
            final memories = provider.memories ?? [];
            if (memories.isEmpty) {
              return const Center(child: Text('Belum ada memori.'));
            }
            // To adjust the position of the card carousel, modify the 'alignment' property.
            // Alignment(x, y):
            // x: -1.0 is far left, 1.0 is far right, 0.0 is center.
            // y: -1.0 is top, 1.0 is bottom, 0.0 is center.
            return Stack(
              children: [
                Align(
                  alignment: const Alignment(0.0, -0.3), // Currently centered
                  child: CarouselSlider.builder(
                    itemCount: memories.length,
                    options: CarouselOptions(
                      height:
                          MediaQuery.of(context).size.height * cardHeightFactor,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false,
                      viewportFraction: cardViewportFraction,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                          _isLastPage = _current == memories.length - 1;
                        });
                      },
                    ),
                    itemBuilder: (context, index, realIdx) => PhotoCard(
                      memory: memories[index],
                    ),
                  ),
                ),
                Visibility(
                  visible: _isLastPage,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 52.0),
                      child: CustomButton(
                        label: 'Lanjut',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CongratsScreen(),
                            ),
                          );
                        },
                        backgroundColor: buttonColor,
                        // To adjust the size of the button, modify the width and height values below.
                        width: 150,
                        height: 50,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
