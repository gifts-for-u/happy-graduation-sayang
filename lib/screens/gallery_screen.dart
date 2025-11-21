import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/memory.dart';
import '../utils/memories_loader.dart';
import '../widgets/photo_card.dart';

class MemoriesProvider with ChangeNotifier {
  MemoriesProvider() {
    _load();
  }

  List<Memory>? _memories;
  bool _loading = true;
  String? _error;

  List<Memory>? get memories => _memories;
  bool get loading => _loading;
  String? get error => _error;

  Future<void> _load() async {
    try {
      _memories = await MemoriesLoader.loadMemories();
    } catch (err) {
      _error = 'Gagal memuat memori: ${err.toString()}';
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            return CarouselSlider.builder(
              itemCount: memories.length,
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * 0.7,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
              ),
              itemBuilder: (context, index, realIdx) => PhotoCard(
                memory: memories[index],
              ),
            );
          },
        ),
      ),
    );
  }
}
