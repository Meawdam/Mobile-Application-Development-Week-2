import 'package:test/test.dart';
import 'package:todo/models/task.dart';
import 'package:todo/services/task_service.dart';

void main() {
  group('Task model tests', () {
    late Task task;

    setUp(() {
      task = Task('Call home');
    });

    test('new task has a title and incomplete status', () {
      expect(task.title, equals('Call home'));
      expect(task.complete, isFalse);
    });

    test('toggleStatus changes the task status', () {
      task.toggleStatus();
      expect(task.complete, isTrue);

      task.toggleStatus();
      expect(task.complete, isFalse);
    });

    test('toString shows title and status', () {
      expect(task.toString(), contains('[ ]'));
      expect(task.toString(), contains('Call home'));
    });
  });

  group('TaskService tests', () {
    late TaskService service;

    setUp(() {
      service = TaskService();
    });

    test('addTask creates a task', () {
      service.addTask('Buy books');

      final tasks = service.viewTasks();
      expect(tasks, hasLength(1));
      expect(tasks.first.title, equals('Buy books'));
      expect(tasks.first.complete, isFalse);
    });

    test('editTask updates a task title', () {
      service.addTask('Buy book');

      expect(service.editTask(1, 'Buy books'), isTrue);
      expect(service.viewTasks().first.title, equals('Buy books'));
    });

    test('deleteTask removes a task', () {
      service.addTask('Buy books');

      expect(service.deleteTask(1), isTrue);
      expect(service.viewTasks(), isEmpty);
    });

    test('toggleTaskStatus changes a task status', () {
      service.addTask('Buy books');

      expect(service.toggleTaskStatus(1), isTrue);
      expect(service.viewTasks().first.complete, isTrue);
    });

    test('searchTasksByTitle returns every matching task', () {
      service.addTask('Cook dinner');
      service.addTask('Cook breakfast');
      service.addTask('Read a book');

      final results = service.searchTasksByTitle('COOK');
      expect(results, hasLength(2));
      expect(results.map((task) => task.title), containsAll([
        'Cook dinner',
        'Cook breakfast',
      ]));
    });

    test('clearTasks removes all tasks', () {
      service.addTask('Buy books');
      service.addTask('Cook dinner');

      service.clearTasks();
      expect(service.viewTasks(), isEmpty);
    });
  });
}
