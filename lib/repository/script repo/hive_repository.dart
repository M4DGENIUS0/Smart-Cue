import '../../model/script_model.dart';

abstract class HiveRepository {
  Future<void> addScript(ScriptModel script);
  Future<void> updateScript(String id, ScriptModel UpdateScript);
  Future<void> deleteScript(String id);
  List<ScriptModel> getAllScript();
  ScriptModel? getScriptbyID(String id);
}
