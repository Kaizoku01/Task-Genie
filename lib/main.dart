import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/Screens/task_screen.dart';
import 'package:todoey/Modals/task_data.dart';
import 'package:todoey/Services/hive_manager.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await HiveManager().hiveInitializer();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: const MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}
