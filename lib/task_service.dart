import 'task.dart';
import 'utils/output.dart';

/// Provides operations for the current session's tasks.
class TaskService {
  void viewTasks() {
    Output.writeln('-------All Tasks-------');
    if (tasks.isEmpty) {
      Output.writeln('No existing tasks.');
      return;
    }

    Output.writeln('\nYour tasks:');
    for (var index = 0; index < tasks.length; index++) {
      Output.writeln('${index + 1}. ${tasks[index]}');
    }
  }
}
