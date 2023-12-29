import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:todoey/Modals/task.dart';

class TaskData extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(taskBody: 'Task 1'),
    Task(taskBody: 'Task 2'),
    Task(taskBody: 'Task 3'),
  ];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String newTaskTitle) {
    final task = Task(taskBody: newTaskTitle);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
