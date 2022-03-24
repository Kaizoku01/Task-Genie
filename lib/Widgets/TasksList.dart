import 'package:flutter/material.dart';
import 'package:todoey/Widgets/TasksTile.dart';
import 'package:provider/provider.dart';
import 'package:todoey/Modals/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskdata, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskdata.tasks[index];
            return TasksTile(
              isChecked: task.isDone,
              taskTitle: task.name,
              checkboxCallback: (checkboxState) {
                taskdata.updateTask(task);
              },
              longPressCallback: () {
                taskdata.deleteTask(task);
              },
            );
          },
          itemCount: taskdata.taskCount,
        );
      },
    );
  }
}
