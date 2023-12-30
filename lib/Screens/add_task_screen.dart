import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/Modals/task_data.dart';
import 'package:todoey/common/themes/app_color_scheme.dart';
import 'package:todoey/common/themes/app_text_theme.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? newTaskTitle;
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Task is...',
            textAlign: TextAlign.center,
            style: TaskGenieTextTheme.taskGenieTextTheme(
                    TaskGenieColor.colorPalette4)
                .titleMedium,
          ),
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            onChanged: (newText) {
              newTaskTitle = newText;
            },
            cursorColor: TaskGenieColor.colorPalette6,
            cursorHeight: 20,
            style: TaskGenieTextTheme.taskGenieTextTheme(
                    TaskGenieColor.colorPalette6)
                .displayMedium,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: TaskGenieColor.colorPalette6),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: TaskGenieColor.colorPalette6),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25.0, left: 70, right: 70),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: TaskGenieColor.colorPalette1,
              ),
              child: Text(
                'Add',
                style: TaskGenieTextTheme.taskGenieTextTheme(
                        Colors.white)
                    .labelMedium,
              ),
              onPressed: () {
                Provider.of<TaskData>(context, listen: false)
                    .addTask(newTaskTitle!, context);
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
