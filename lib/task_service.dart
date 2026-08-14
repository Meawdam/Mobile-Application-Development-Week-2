import 'task.dart';

/// Provides operations for the current session's tasks.
class TaskService {
  /// Returns current tasks without exposing the list for modification.
  List<String> viewTasks() => List.unmodifiable(tasks);

  /// Adds a non-empty task to the list.
  void addTask(String task) {
    final trimmedTask = task.trim();
    if (trimmedTask.isEmpty) {
      return;
    }
    tasks.add(trimmedTask);
  }
}
