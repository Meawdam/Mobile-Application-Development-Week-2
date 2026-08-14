class Task {
  Task(this.title);

  final String title;
  bool complete = false;

  void toggleStatus() {
    complete = !complete;
  }

  @override
  String toString() => '${complete ? '[X]' : '[ ]'} $title';
}
