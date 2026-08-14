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

  /// Deletes the task shown at the one-based [taskNumber].
  ///
  /// Returns `false` if the task number does not exist.
  bool deleteTask(int id) {
    final index = id - 1;
    if (index < 0 || index >= tasks.length) {
      return false;
    }

    tasks.removeAt(index);
    return true;
  }
}
