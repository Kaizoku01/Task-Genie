import 'package:flutter/material.dart';
import 'package:todoey/common/themes/app_color_scheme.dart';
import 'package:todoey/common/themes/app_text_theme.dart';

class TasksTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function(bool?) checkboxCallback;
  final Function()? longPressCallback;
  final int index;
  const TasksTile(
      {Key? key,
      required this.isChecked,
      required this.taskTitle,
      required this.checkboxCallback,
      this.longPressCallback,
        this.index = 0,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallback,
      title: Text(
        '$index. $taskTitle',
        style: TaskGenieTextTheme.taskGenieTextTheme(Colors.black)
            .displayMedium!
            .copyWith(
                decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        activeColor: TaskGenieColor.colorPalette4,
        value: isChecked,
        onChanged: checkboxCallback,
      ),
    );
  }
}
