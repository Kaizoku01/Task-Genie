import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/Modals/task.dart';
import 'package:todoey/Screens/task_screen.dart';
import 'package:todoey/Modals/task_data.dart';
import 'package:todoey/Services/hive_manager.dart';
import 'package:todoey/common/themes/app_color_scheme.dart';
import 'package:todoey/common/themes/app_text_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await HiveManager().hiveInitializer();

  final List<Task> taskList = TaskData().initialFetch();

  runApp(
    ChangeNotifierProvider(
      create: (context) => TaskData()..setList(taskList),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: TaskGenieColor.colorPalette1,
        fontFamily: "Jost",
        textTheme: TaskGenieTextTheme.taskGenieTextTheme(Colors.black),
      ),
      home: const TasksScreen(),
    );
  }
}
