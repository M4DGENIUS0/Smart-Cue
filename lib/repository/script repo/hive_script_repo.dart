import 'dart:async';

import 'package:smartcue/config/demo/demo.dart';
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
    _emitScripts(); // Emit updated list
  }

  @override
  Future<void> deleteScript(String id) async {
    if (_script.containsKey(id)) {
      await _script.delete(id);
      _emitScripts(); // Emit updated list
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
  Future<void> updateScript(String id, ScriptModel updateScript) async {
    if (_script.containsKey(id)) {
      await _script.put(id, updateScript);
      _emitScripts(); // Emit updated list
    }
  }

  @override
  Future<void> initializeDemoScript() async {
    if (_script.isEmpty) {
      final demoScript = ScriptModel(
        id: 'Demo Script',
        title: 'Demo Script',
        content: demo_script,
        createdAt: DateTime.now(),
        isGenerated: false,
      );
      await _script.put(demoScript.id, demoScript);
      _emitScripts(); // Emit updated list
    }
  }

  void _emitScripts() {
    _scriptsController.add(_script.values.toList());
  }
}
