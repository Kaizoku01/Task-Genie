import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/Modals/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? newTaskTitle;
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Add Task',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30.0, color: Colors.lightBlueAccent),
          ),
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            onChanged: (newText) {
              newTaskTitle = newText;
            },
          ),
          TextButton(
            style:
                TextButton.styleFrom(backgroundColor: Colors.lightBlueAccent),
            child: Text(
              'Add',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              Provider.of<TaskData>(context, listen: false)
                  .addTask(newTaskTitle!);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
