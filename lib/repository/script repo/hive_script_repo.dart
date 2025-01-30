import 'dart:async';

import 'package:smartcue/model/script_model.dart';
import '../../services/hive_services.dart';

class HiveScriptRepository {
  static final HiveScriptRepository _instance =
      HiveScriptRepository._internal();
  factory HiveScriptRepository() => _instance;
  HiveScriptRepository._internal();

  final _script = HiveService.scriptBox;
  final StreamController<List<ScriptModel>> _scriptsController =
      StreamController<List<ScriptModel>>.broadcast();

  Stream<List<ScriptModel>> get scriptsStream => _scriptsController.stream;

  void _emitScripts() {
    _scriptsController.add(_script.values.toList());
  }

  Future<void> addScript(ScriptModel script) async {
    await _script.put(script.id, script);
    _emitScripts(); // Emit updated list
  }

  Future<void> deleteScript(String id) async {
    if (_script.containsKey(id)) {
      await _script.delete(id);
      _emitScripts(); // Emit updated list
    }
  }

  List<ScriptModel> getAllScript() {
    return _script.values.toList();
  }

  ScriptModel? getScriptbyID(String id) {
    return _script.get(id);
  }

  Future<void> updateScript(String id, ScriptModel updateScript) async {
    if (_script.containsKey(id)) {
      await _script.put(id, updateScript);
      _emitScripts(); // Emit updated list
    }
  }
}
