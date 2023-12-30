import 'package:hive_flutter/adapters.dart';
import '../Modals/task.dart';

///[HiveManager] This class follows Singleton Design Pattern,
///thus allowing only one instance of Hive throughout appLife cycle

class HiveManager {
  ///[_hiveManager] instance of hive
  static HiveManager? _hiveManager;

  ///[_myBox] instance of box
  late Box _myBox;

  ///[_boxName] boxName for identification in the local storage
  static const String _boxName = 'tasks';

  //private constructor
  HiveManager._();

  factory HiveManager(){
    _hiveManager ??= HiveManager._();
    return _hiveManager!;
  }

  ///[hiveInitializer] this method holds the initialization of Hive in Flutter and
  ///registering [TaskAdapter] also creation of a fixed box.
  Future<void> hiveInitializer() async{
    await Hive.initFlutter();

    Hive.registerAdapter(TaskAdapter());

    _myBox = await Hive.openBox(_boxName);
  }

  ///[hiveTaskBox] public getter for the private [_myBox] box
  Box get hiveTaskBox => _myBox;
}