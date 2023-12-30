import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/Modals/task_data.dart';
import '../../constants.dart';
import 'tasks_tile.dart';

class TasksList extends StatelessWidget {
  const TasksList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TasksTile(
              isChecked: task.isDone,
              taskTitle: task.taskBody,
              checkboxCallback: (checkboxState) {
                taskData.updateTask(task, context);
              },
              longPressCallback: () {
                taskData.deleteTask(task, context);
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
