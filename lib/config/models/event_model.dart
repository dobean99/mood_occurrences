class EventModel {
  final DateTime date;
  final String title;
  final String description;

  EventModel({
    required this.date,
    required this.title,
    required this.description,
  });

  // Convert Stats object to a Map that can be encoded to JSON
  Map<String, dynamic> toJson() {
    return {
      'date': date.toIso8601String(),
      'title': title,
      'description': description,
    };
  }

  EventModel copyWith({
    DateTime? date,
    String? title,
    String? description,
  }) {
    return EventModel(
      date: date ?? this.date,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }

  // Factory method to create a Stats object from a Map
  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      date: DateTime.parse(json['date'] ?? ''),
      title: json['title'] ?? '',
      description: json['description'] ?? '',
    );
  }

  @override
  String toString() {
    return 'Stats {'
        ' date: $date,'
        ' title: $title,'
        ' description: $description,'
        '}';
  }
}
