import '../models/task.dart';

/// Manages the Todo application's tasks.
class TaskService {
  final List<Task> _tasks = [];

  List<Task> viewTasks() => List.unmodifiable(_tasks);

  void addTask(String title) {
    final trimmedTitle = title.trim();
    if (trimmedTitle.isNotEmpty) {
      _tasks.add(Task(trimmedTitle));
    }
  }

  bool deleteTask(int taskNumber) {
    final index = taskNumber - 1;
    if (index < 0 || index >= _tasks.length) {
      return false;
    }

    _tasks.removeAt(index);
    return true;
  }

  bool toggleTaskStatus(int taskNumber) {
    final index = taskNumber - 1;
    if (index < 0 || index >= _tasks.length) {
      return false;
    }

    _tasks[index].toggleStatus();
    return true;
  }

  void clearTasks() => _tasks.clear();

  bool editTask(int taskNumber, String title) {
    final index = taskNumber - 1;
    final trimmedTitle = title.trim();
    if (index < 0 || index >= _tasks.length || trimmedTitle.isEmpty) {
      return false;
    }

    _tasks[index].title = trimmedTitle;
    return true;
  }
}
