import 'dart:convert';

Task taskFromJson(String str) => Task.fromJson(json.decode(str));

String taskToJson(Task data) => json.encode(data.toJson());

class Task {
  int id;
  String startTime;
  String duration;
  bool isRunning;
  int count;

  Task({
    required this.id,
    required this.startTime,
    required this.duration,
    required this.isRunning,
    required this.count,
  });

  Task copyWith({
    int? id,
    String? startTime,
    String? duration,
    bool? isRunning,
    int? count,
  }) =>
      Task(
        id: id ?? this.id,
        startTime: startTime ?? this.startTime,
        duration: duration ?? this.duration,
        isRunning: isRunning ?? this.isRunning,
        count: count ?? this.count,
      );

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json["id"],
        startTime: json["startTime"],
        duration: json["duration"],
        isRunning: json["isRunning"],
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "startTime": startTime,
        "duration": duration,
        "isRunning": isRunning,
        "count": count,
      };

  factory Task.empty() => Task(
        id: 0,
        startTime: '',
        duration: '00:00:00',
        isRunning: false,
        count: 0,
      );
}
