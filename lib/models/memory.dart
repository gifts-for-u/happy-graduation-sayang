class Memory {
  Memory({
    required this.src,
    required this.date,
    required this.title,
    required this.caption,
  });

  factory Memory.fromJson(Map<String, dynamic> json) => Memory(
        src: json['src'] as String,
        date: json['date'] as String,
        title: (json['title'] ?? '') as String,
        caption: json['caption'] as String,
      );

  final String src;
  final String date;
  final String title;
  final String caption;
}
