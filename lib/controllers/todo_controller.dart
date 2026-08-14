import '../models/task.dart';
import '../services/task_service.dart';
import '../utils/input.dart';
import '../utils/output.dart';
import '../views/todo_menu.dart';

/// Handles menu choices and coordinates the Todo command-line interface.
class TodoController {
  final TaskService _taskService = TaskService();

  void run() {
    while (true) {
      showTodoMenu();
      final option = Input.readInt('Select an option (1-8): ');

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
        _deleteTask();
        break;
      case 4:
        _toggleTaskStatus();
        break;
      case 5:
        _clearTasks();
        break;
      case 6:
        _editTask();
        break;
      case 7:
        _searchTasks();
        break;
      case 8:
        Output.writeln('Goodbye!');
        return false;
      default:
        Output.writeln('Invalid option. Please choose a number from 1 to 8.');
    }

    return true;
  }

  void _showTasks(List<Task> tasks) {
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
    final title = Input.readString('Enter task: ');
    if (title.trim().isEmpty) {
      Output.writeln('Task cannot be empty.');
      return;
    }

    _taskService.addTask(title);
    Output.writeln('Task added.');
  }

  void _deleteTask() {
    final tasks = _taskService.viewTasks();
    if (tasks.isEmpty) {
      Output.writeln('No existing tasks to delete.');
      return;
    }

    _showTasks(tasks);
    final taskNumber = Input.readInt('Enter task number to delete: ');
    if (_taskService.deleteTask(taskNumber)) {
      Output.writeln('Task deleted.');
    } else {
      Output.writeln('Invalid task number.');
    }
  }

  void _toggleTaskStatus() {
    final tasks = _taskService.viewTasks();
    if (tasks.isEmpty) {
      Output.writeln('No existing tasks to update.');
      return;
    }

    _showTasks(tasks);
    final taskNumber = Input.readInt('Enter task number to toggle: ');
    if (_taskService.toggleTaskStatus(taskNumber)) {
      Output.writeln('Task status updated.');
    } else {
      Output.writeln('Invalid task number.');
    }
  }

  void _clearTasks() {
    _taskService.clearTasks();
    Output.writeln('All tasks deleted.');
  }

  void _searchTasks() {
    final query = Input.readString('Search task title: ');
    if (query.trim().isEmpty) {
      Output.writeln('Search title cannot be empty.');
      return;
    }

    final results = _taskService.searchTasksByTitle(query);
    if (results.isEmpty) {
      Output.writeln('No matching tasks found.');
      return;
    }

    Output.writeln('------- Search Results -------');
    for (var index = 0; index < results.length; index++) {
      Output.writeln('${index + 1}. ${results[index]}');
    }
  }

  void _editTask() {
    final tasks = _taskService.viewTasks();
    if (tasks.isEmpty) {
      Output.writeln('No existing tasks to edit.');
      return;
    }

    _showTasks(tasks);
    final taskNumber = Input.readInt('Enter task number to edit: ');
    final title = Input.readString('Enter new task title: ');
    if (title.trim().isEmpty) {
      Output.writeln('Task title cannot be empty.');
      return;
    }

    if (_taskService.editTask(taskNumber, title)) {
      Output.writeln('Task edited.');
    } else {
      Output.writeln('Invalid task number.');
    }
  }
}
