import '../utils/output.dart';

/// Displays the Todo application's available actions.
void showTodoMenu() {
  Output.writeln('\n======= TODO app =======');
  Output.writeln('1. View Tasks');
  Output.writeln('2. Add Task');
  Output.writeln('3. Delete Task');
  Output.writeln('4. Toggle Task Status');
  Output.writeln('5. Clear All Tasks');
  Output.writeln('6. Edit Task');
  Output.writeln('7. Search Tasks');
  Output.writeln('8. Exit');
  Output.writeln('========================');
}
