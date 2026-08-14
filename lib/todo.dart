import 'todo_controller.dart';

class TodoApp {
  TodoApp({TodoController? controller})
      : _controller = controller ?? TodoController();

  final TodoController _controller;

  void run() => _controller.run();
}
