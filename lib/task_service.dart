import 'task_model.dart';

class TaskService {
  final List<Task> _tasks = [];

  List<Task> viewTasks() => List.unmodifiable(_tasks);

  void addTask(String task) {
    final trimmedTask = task.trim();
    if (trimmedTask.isEmpty) {
      return;
    }
    _tasks.add(Task(trimmedTask));
  }

  bool deleteTask(int id) {
    final index = id - 1;
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

  void clearTasks() {
    _tasks.clear();
  }
}
