import 'task.dart';
import 'utils/output.dart';
import 'utils/input.dart';

/// Provides operations for the current session's tasks.
class TaskService {
  void viewTasks() {
    Output.writeln('-------All Tasks-------');
    if (tasks.isEmpty) {
      Output.writeln('No existing tasks.');
      return;
    }

    Output.writeln('\nYour tasks:');
    for (var i = 0; i < tasks.length; i++) {
      Output.writeln('${i + 1}. ${tasks[i]}');
    }
  }

  void addTask() {
    final task = Input.readString("Enter task: ");
    tasks.add(task);
  }
}
