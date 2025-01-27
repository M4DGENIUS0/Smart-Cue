import 'package:hive/hive.dart';

part 'script_model.g.dart'; // Required for code generation

@HiveType(typeId: 1) // Assign a unique type ID
class ScriptModel {
  @HiveField(0)
  final String id; // Unique identifier for the script
  @HiveField(1)
  final String title; // Title of the script
  @HiveField(2)
  final String content; // Text content of the script
  @HiveField(3)
  final bool isGenerated; // Whether the script is AI-generated
  @HiveField(4)
  final DateTime createdAt; // Creation timestamp

  ScriptModel({
    required this.id,
    required this.title,
    required this.content,
    required this.isGenerated,
    required this.createdAt,
  });
}
