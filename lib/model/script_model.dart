import 'package:hive/hive.dart';

part 'script_model.g.dart';

@HiveType(typeId: 1)
class ScriptModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String content;
  @HiveField(3)
  final bool isGenerated;
  @HiveField(4)
  final DateTime createdAt;

  ScriptModel({
    required this.id,
    required this.title,
    required this.content,
    required this.isGenerated,
    required this.createdAt,
  });
}
