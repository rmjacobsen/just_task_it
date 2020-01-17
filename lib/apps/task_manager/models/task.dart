class Task {
  final String id;
  final String title;
  final String description;
  bool isDone;
  final DateTime date;
  final String listId;

  Task({
    this.id,
    this.title,
    this.description,
    this.isDone,
    this.date,
    this.listId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isDone': isDone ? 1 : 0,
      'date': date.toIso8601String(),
      'listId': listId,
    };
  }
}