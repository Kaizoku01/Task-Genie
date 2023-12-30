import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:todoey/Modals/task.dart';
import 'package:todoey/Services/hive_manager.dart';

class TaskData extends ChangeNotifier {
  ///[dataKey] this is the key used to store and identify data stored in the local system by hive
  static const dataKey = 'taskList';

  ///[_tasks] This holds all the tasks throughout app life cycle.
  List<Task>? _tasks;

  ///[hiveTaskBox] this is the instance of hiveBox (called from HiveManager)
  final hiveTaskBox = HiveManager().hiveTaskBox;

  ///[tasks] a public getter for our private [_tasks] provider
  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks!);
  }

  ///[taskCount] returns the count of tasks present in the [_tasks] provider List
  int get taskCount {
    _tasks ??= [];
    return _tasks!.length;
  }

  ///[addTask] this method add new Task to the [_tasks] Provider List and
  ///also to the Local storage using Hive
  Future<void> addTask(String newTaskTitle) async {
    //TaskString to usable Task Object
    final task = Task(taskBody: newTaskTitle);

    //appending the Task Object to provider List
    _tasks!.add(task);

    //appending the updated task provider list to the local storage
    await hiveTaskBox.put(dataKey, _tasks);

    //notifying the listing classes about the update for them to update the UI
    notifyListeners();
  }

  ///[updateTask] this method updates Task and [_tasks] Provider List and
  ///also to the Local storage using Hive
  Future<void> updateTask(Task task) async {
    //toggle b/w task completion or not completion
    task.toggleDone();

    //updating the local storage accordingly
    await hiveTaskBox.put(dataKey, _tasks);

    //notifying the listing classes about the update for them to update the UI
    notifyListeners();
  }

  ///[deleteTask] this method deletes the Task from [_tasks] Provider List and
  ///also to the Local storage using Hive
  ///NOTE: Hive do not delete any data it only unIndex it.
  ///For removal of data compaction strategy is added upon box creation.
  Future<void> deleteTask(Task task) async {
    //task provider list removes the task from the list
    _tasks!.remove(task);

    //updated list overrides the previous list
    await hiveTaskBox.put(dataKey, _tasks);

    //notifying the listing classes about the update for them to update the UI
    notifyListeners();
  }

  ///[setList] this method is used to initialize the [_tasks] provider list
  ///with previously stored data upon app start
  void setList(List<Task> newList) {
    //updating the provider list
    _tasks = newList;

    //notifying the listing classes about the update for them to update the UI
    notifyListeners();
  }

  ///[initialFetch] this method fetches previously stored Tasks from the local storage
  List<Task> initialFetch(){

    //fetched data from local storage
    final fetchedData =
    hiveTaskBox.get(dataKey, defaultValue: []) as List<dynamic>;

    //converted it into usable Task type and appending into a List<Task>
    List<Task> taskList = fetchedData.map((dynamic item) {
      item = item as Task;
      return Task(taskBody: item.taskBody, isDone: item.isDone);
    }).toList();

    //returning the fetched TaskList
    return taskList;
  }

}
