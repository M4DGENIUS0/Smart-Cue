import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../model/script_model.dart';

class HiveService {
  static Future<void> initHive() async {
    // Initialize Hive
    await Hive.initFlutter();

    // Register adapters
    Hive.registerAdapter(ScriptModelAdapter());

    // Open a box to store scripts
    await Hive.openBox<ScriptModel>('script');
  }

  static Box<ScriptModel> get scriptBox => Hive.box<ScriptModel>('script');
}
