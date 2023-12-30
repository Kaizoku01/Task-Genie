import 'package:hive/hive.dart';

part 'task.g.dart';

///This is Data Model class used by both internal Program for clean usage of Data and
///used by Hive to store data in correct Format

@HiveType(typeId: 1)
class Task {

  @HiveField(0)
  final String taskBody;

  @HiveField(1)
  bool isDone;

  Task({this.taskBody = '', this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
  }
}
