import 'task.dart';
class TaskService {
  List<String> viewTasks() => List.unmodifiable(tasks);

  void addTask(String task) {
    final trimmedTask = task.trim();
    if (trimmedTask.isEmpty) {
      return;
    }
    tasks.add(trimmedTask);
  }

  bool deleteTask(int id) {
    final index = id - 1;
    if (index < 0 || index >= tasks.length) {
      return false;
    }

    tasks.removeAt(index);
    return true;
  }

  void clearTask() {
    tasks.clear();
  }
}
