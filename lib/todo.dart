import 'menu.dart';
import 'task_service.dart';
import 'utils/input.dart';
import 'utils/output.dart';

/// Coordinates the command-line Todo application.
class TodoApp {
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
        _taskService.viewTasks();
        break;
      case 2:
        _taskService.addTask();
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
}
