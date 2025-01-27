import 'dart:async';

import 'package:smartcue/model/script_model.dart';

import '../../services/hive_services.dart';
import 'hive_repository.dart';

class HiveScriptRepository implements HiveRepository {
  final _script = HiveService.scriptBox;
  final StreamController<List<ScriptModel>> _scriptsController =
      StreamController<List<ScriptModel>>.broadcast();
  Stream<List<ScriptModel>> get scriptsStream => _scriptsController.stream;
  @override
  Future<void> addScript(ScriptModel script) async {
    await _script.put(script.id, script);
  }

  @override
  Future<void> deleteScript(String id) async {
    if (_script.containsKey(id)) {
      await _script.delete(id);
    }
  }

  @override
  List<ScriptModel> getAllScript() {
    return _script.values.toList();
  }

  @override
  ScriptModel? getScriptbyID(String id) {
    return _script.get(id);
  }

  @override
  Future<void> updateScript(String id, ScriptModel UpdateScript) async {
    if (_script.containsKey(id)) {
      await _script.put(id, UpdateScript);
    }
  }
}
