class Entry {
  final String id;
  final String date;
  final String time;
  String title;
  String description;

  Entry({
    required this.id,
    required this.date,
    required this.time,
    required this.title,
    required this.description,
  });

  Entry.empty()
      : id = '',
        date = '',
        time = '',
        title = '',
        description = '';

  factory Entry.fromJson(Map<String, dynamic> json) => Entry(
        id: json['id'] as String,
        date: json['date'] as String,
        time: json['time'] as String,
        title: json['title'] as String,
        description: json['description'] as String,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'date': date,
        'time': time,
        'title': title,
        'description': description,
      };
}
