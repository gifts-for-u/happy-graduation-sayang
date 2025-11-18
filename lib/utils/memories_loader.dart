import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

import '../models/memory.dart';

class MemoriesLoader {
  const MemoriesLoader._();

  static Future<List<Memory>> loadMemories() async {
    final jsonString = await rootBundle.loadString('assets/data/memories.json');
    final List<dynamic> decoded = json.decode(jsonString) as List<dynamic>;
    return decoded
        .map((item) => Memory.fromJson(item as Map<String, dynamic>))
        .toList();
  }
}
