# Mobile Development Laboratory — Week 2: Dart TODO App

## Objectives

* Practice Dart through a Dart console application.

## References

* Dart Language Tour: https://dart.dev/guides/language/language-tour
* Try Dart: https://dart.dev/#try-dart

---

# Exercise 1: Create a Menu and Get a Choice

Create a basic TODO menu and allow the user to select an option from 1–6.

### Menu

```text
========== TODO app ==========
1. View Tasks
2. Add Task
3. Delete Task
4. Toggle Task Status
5. Clear All Tasks
6. Exit
=============================
Select an option (1-6): 1
You choose 1
```

### Starter Code

```dart
import 'dart:io';

void main() {
  print("\n========== TODO app ==========");
  print("1. View Tasks");
  print("2. Add Task");
  print("3. Delete Task");
  print("4. Toggle Task Status");
  print("5. Clear All Tasks");
  print("6. Exit");
  print("=============================");

  stdout.write("Select an option (1-6): ");

  // remaining codes…
}
```

---

# Exercise 2: Looping Menu

Update Exercise 1 so that the menu keeps showing until the user chooses **6. Exit**.

### Expected Behavior

```text
========== TODO app ==========
1. View Tasks
2. Add Task
3. Delete Task
4. Toggle Task Status
5. Clear All Tasks
6. Exit
=============================
Select an option (1-6): 1
You choose 1

========== TODO app ==========
1. View Tasks
2. Add Task
3. Delete Task
4. Toggle Task Status
5. Clear All Tasks
6. Exit
=============================
Select an option (1-6): 6
Goodbye
```

### Starter Code

```dart
import 'dart:io';

void main() {
  String? choice;

  do {
    showMenu();
    stdout.write("Select an option (1-6): ");

    // remaining codes…
  } while (choice != '6');
}

void showMenu() {
  print("\n========== TODO app ==========");
  print("1. View Tasks");
  print("2. Add Task");
  print("3. Delete Task");
  print("4. Toggle Task Status");
  print("5. Clear All Tasks");
  print("6. Exit");
  print("=============================");
}
```

---

# Exercise 3: Store Tasks Using a List

Use a `List<String>` to store tasks.

Implement:

* View tasks
* Add a new task
* Display all existing tasks
* Show `No existing tasks` when the list is empty

### Example

```text
Select an option (1-6): 1
--------- All Tasks --------
No existing tasks

Select an option (1-6): 2
Enter task: Cook

Select an option (1-6): 2
Enter task: Sleep

Select an option (1-6): 1
--------- All Tasks --------
1. Cook
2. Sleep
```

### Starter Code

```dart
import 'dart:io';

void main() {
  List<String> tasks = [];
  String? choice;

  // remaining codes…
}

void showMenu() {
  print("\n========== TODO app ==========");
  print("1. View Tasks");
  print("2. Add Task");
  print("3. Delete Task");
  print("4. Toggle Task Status");
  print("5. Clear All Tasks");
  print("6. Exit");
  print("=============================");
}
```

---

# Exercise 4: Delete and Clear All Tasks

Complete the following menu choices:

* **3. Delete Task**
* **5. Clear All Tasks**

### Hint

Use `removeAt()` to delete a member of a list.

Use `clear()` to remove all members of a list.

You must also validate the task ID before deleting.

### Expected Behavior

```text
Select an option (1-6): 3
Enter task ID: 1
Success: task deleted

Select an option (1-6): 5
Success: all tasks deleted
```

When there are no tasks:

```text
--------- All Tasks --------
No existing tasks
```

### Starter Code

```dart
import 'dart:io';

void main() {
  List<String> tasks = [];
  String? choice;

  // remaining codes…
}

void showMenu() {
  print("\n========== TODO app ==========");
  print("1. View Tasks");
  print("2. Add Task");
  print("3. Delete Task");
  print("4. Toggle Task Status");
  print("5. Clear All Tasks");
  print("6. Exit");
  print("=============================");
}
```

---

# Exercise 5: Task Status and Toggle Function

Modify the application so that every task keeps its own completion status.

### Hint

Change the data structure to:

```dart
List<Map<String, dynamic>> tasks = [];
```

Each task can contain:

```dart
{
  "title": "Cook",
  "complete": false,
}
```

### Expected Behavior

New task:

```text
1. [ ] Sleep
```

After toggling:

```text
1. [X] Sleep
```

### Starter Code

```dart
import 'dart:io';

void main() {
  List<Map<String, dynamic>> tasks = [
    // {"title": "Cook", "complete": false},
  ];

  String? choice;

  // remaining codes…
}

void showMenu() {
  print("\n========== TODO app ==========");
  print("1. View Tasks");
  print("2. Add Task");
  print("3. Delete Task");
  print("4. Toggle Task Status");
  print("5. Clear All Tasks");
  print("6. Exit");
  print("=============================");
}
```

---

# Exercise 6: Use a Class to Keep Tasks

Replace the Map-based task structure with a `Task` class.

## task_model.dart

```dart
class Task {
  String title = '';
  bool complete = false;

  // Constructor
  Task(this.title);

  // Toggle status
  void toggleStatus() {
    complete = !complete;
  }

  // Show task
  // String showTask() {
  //   String status = complete ? '[X]' : '[ ]';
  //   return "$status $title";
  // }

  // Or override toString() so we can print the Object directly
  @override
  String toString() {
    String status = complete ? '[X]' : '[ ]';
    return " $status $title";
  }
}
```

## main.dart

```dart
import 'dart:io';
import 'task_model.dart';

void main() {
  List<Task> tasks = [];
  String? choice;

  // remaining codes…
}

void showMenu() {
  print("\n========== TODO app ==========");
  print("1. View Tasks");
  print("2. Add Task");
  print("3. Delete Task");
  print("4. Toggle Task Status");
  print("5. Clear All Tasks");
  print("6. Exit");
  print("=============================");
}
```

The program should produce the same results as Exercise 5.

---

# Exercise 7: 3-Tier Layer Architecture

Extend the previous application by using the 3-tier layer concept:

* **Data** — data models/schema
* **Logics** — application logic
* **Views** — user interface, inputs, and outputs

## todo_model.dart — Data Schema

```dart
class Task {
  String title = '';
  bool complete = false;

  // Constructor
  Task(this.title);

  // Toggle status
  void toggleStatus() {
    complete = !complete;
  }

  // Show task
  // String showTask() {
  //   String status = complete ? '[X]' : '[ ]';
  //   return "$status $title";
  // }

  // Or override toString() so we can print the Object directly
  @override
  String toString() {
    String status = complete ? '[X]' : '[ ]';
    return " $status $title";
  }
}
```

## todo_logic.dart — Logic Layer

````dart
import 'todo_model.dart';

class Todo {
  List<Task> todos = [];

  // Get all tasks
  // List<Task> getTodos() {
  //   return todos;
  // }

  /// Add a new task.
  ///
  /// [String] is a new task title to add.
  ///
  /// ```dart
  /// addTask('Buy coffee');
  /// ```
  void addTask(String task) {
    todos.add(Task(task));
  }

  // remaining codes…
}
````

## todo_main.dart — View / UI / Inputs / Outputs

```dart
import 'dart:io';
import 'todo_controller.dart';
import 'todo_model.dart';

void main() {
  // create Todos
  Todo todo = Todo();

  // remaining codes…

  String? choice;
}
```

### Updated Menu

```text
========== TODO app ==========
1. View Tasks
2. Add Task
3. Delete Task
4. Toggle Task Status
5. Clear All Tasks
6. Edit Task
7. Search Tasks
8. Exit
=============================
```

---

# Exercise 8: Unit Testing

Unit testing is a test of functions or logic without considering inputs/outputs or user interfaces.

In Dart, unit tests can be performed automatically using the `test` package.

## 1. Create a Dart Project

At the terminal:

```bash
dart create todo_app
```

## 2. Install the test Package

Inside the project folder:

```bash
dart pub add dev:test
```

## 3. Project Structure

Add `todo_main.dart` to the `bin` folder.

Add `todo_model.dart` and `todo_logic.dart` to the `lib` folder.

Create `todo_test.dart` in the `test` folder.

```text
todo_app/
├── bin/
│   └── todo_main.dart
├── lib/
│   ├── todo_model.dart
│   └── todo_logic.dart
└── test/
    └── todo_test.dart
```

## 4. todo_test.dart

```dart
// Unit test for testing logics, no user inputs
// dart test test/todo_testing.dart --reporter=expanded

import 'package:test/test.dart';
import 'package:todo_app/todo_logic.dart';
import 'package:todo_app/todo_model.dart';

void main() {
  group('Todo model test:', () {
    late Task task;

    // setUp will be valid for all tests
    setUp(() {
      task = Task('Call home');
    });

    test('Create task should have title and status', () {
      expect(task.title, equals('Call home'));
      expect(task.complete, isFalse);
    });

    test('Toggle task status should make the status changes', () {
      // default status is false
      task.toggleStatus();

      expect(task.complete, isTrue);

      task.toggleStatus();

      expect(task.complete, isFalse);
    });

    test('Show task should have title and status', () {
      expect(task.toString(), contains('[ ]'));
      expect(task.toString(), contains('Call home'));
    });
  }, skip: 'this test is bypassed');

  group('Todo controller test:', () {
    late Todo todo;

    setUp(() {
      todo = Todo();
    });

    test('Add task should create a new task', () {
      todo.addTask('Buy books');

      expect(todo.todos.length, equals(1));
      expect(todo.todos[0].toString(), contains('[ ] Buy books'));

      todo.addTask('Cook dinner');

      expect(todo.todos.length, equals(2));
    });

    // remaining codes…
  });
}
```

## 5. Run the Test

```bash
dart test test/todo_testing.dart
```

---

# Assignment 1: Add Edit and Search Menus

Add two more menus:

## A. Edit Task

The edit function is based on the task ID.

The user should be able to select a task using its ID and change its title.

## B. Search Tasks

Search by the task's title.

The search can return multiple results.

### Files to Complete

```text
todo_logic.dart
todo_main.dart
```

---

# Assignment 2: Complete Unit Tests

Complete the unit test file so that it tests all controller functions.

### File to Complete

```text
todo_test.dart
```

---

# Submission Checklist

* [ ] Exercise 1 completed
* [ ] Exercise 2 completed
* [ ] Exercise 3 completed
* [ ] Exercise 4 completed
* [ ] Exercise 5 completed
* [ ] Exercise 6 completed
* [ ] Exercise 7 completed
* [ ] Exercise 8 completed
* [ ] Assignment 1 completed
* [ ] Assignment 2 completed
* [ ] All unit tests completed
* [ ] All tests run successfully
