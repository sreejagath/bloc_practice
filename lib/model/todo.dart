class Todo {
  String title;
  bool completed;
  String description;
  String duration;
  String createdAt;

  Todo(
      {required this.title,
      required this.completed,
      required this.description,
      required this.duration,
      required this.createdAt});

  Todo.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        completed = json['completed'],
        description = json['description'],
        duration = json['duration'],
        createdAt = json['createdAt'];

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'completed': completed,
      'description': description,
      'duration': duration,
      'createdAt': createdAt
    };
  }
}
