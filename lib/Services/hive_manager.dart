import 'package:hive_flutter/adapters.dart';
import '../Modals/task.dart';

class HiveManager {
  static HiveManager? _hiveManager;
  late Box _myBox;

  factory HiveManager(){
    _hiveManager ??= HiveManager._();
    return _hiveManager!;
  }

  HiveManager._();

  Future<void> hiveInitializer() async{
    await Hive.initFlutter();

    Hive.registerAdapter(TaskAdapter());

    _myBox = await Hive.openBox('tasks');
  }

  Box get hiveTaskBox => _myBox;
}