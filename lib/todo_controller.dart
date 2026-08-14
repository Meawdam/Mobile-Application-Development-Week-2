import 'menu.dart';
import 'task_service.dart';
import 'utils/input.dart';
import 'utils/output.dart';

/// Handles menu choices and coordinates the Todo command-line interface.
class TodoController {
  final TaskService _taskService = TaskService();

  void run() {
    while (true) {
      menu();
      final option = Input.readInt('Select an option (1-6): ');

      if (!_handleOption(option)) {
        return;
      }
    }
  }

  bool _handleOption(int option) {
    switch (option) {
      case 1:
        _showTasks(_taskService.viewTasks());
        break;
      case 2:
        _addTask();
        break;
      case 3:
        Output.writeln('You choose 3');
        break;
      case 4:
        Output.writeln('You choose 4');
        break;
      case 5:
        Output.writeln('You choose 5');
        break;
      case 6:
        Output.writeln('Good bye!!');
        return false;
      default:
        Output.writeln('Invalid option. Please choose a number from 1 to 6.');
    }

    return true;
  }

  void _showTasks(List<String> tasks) {
    Output.writeln('------- All Tasks -------');
    if (tasks.isEmpty) {
      Output.writeln('No existing tasks.');
      return;
    }

    for (var index = 0; index < tasks.length; index++) {
      Output.writeln('${index + 1}. ${tasks[index]}');
    }
  }

  void _addTask() {
    final task = Input.readString('Enter task: ');
    if (task.trim().isEmpty) {
      Output.writeln('Task cannot be empty.');
      return;
    }

    _taskService.addTask(task);
    Output.writeln('Task added.');
  }

  
}
