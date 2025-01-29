import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';

class FileExportService {
  static Future<String?> _getExportPath() async {
    final path = await FilePicker.platform.getDirectoryPath();
    return path;
  }

  static Future<bool> _requestStoragePermission() async {
    final status = await Permission.storage.request();
    return status.isGranted;
  }

  static Future<void> exportFile({
    required String content,
    required String fileName,
    required String fileExtension,
  }) async {
    try {
      final hasPermission = await _requestStoragePermission();

      if (!hasPermission) {
        throw Exception('Storage permission denied');
      }

      final exportPath = await _getExportPath();

      if (exportPath == null) {
        throw Exception('No directory selected');
      }

      final filePath = '$exportPath/$fileName.$fileExtension';
      final File file = File(filePath);

      await file.writeAsString(content);
    } catch (e) {
      throw Exception('Export failed: ${e.toString()}');
    }
  }
}
