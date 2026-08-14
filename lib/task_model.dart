class Task {
  String title = '';
  bool complete = false;

  Task(this.title);

  void toggleStatus() {
    complete = !complete;
  }

  @override
  String toString() {
    String status = complete ? '[X]' : '[ ]';
    return " $status $title";
  }
}
