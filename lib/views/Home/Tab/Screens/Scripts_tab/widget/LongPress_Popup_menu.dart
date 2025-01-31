import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../../../model/script_model.dart';
import '../bloc/script_tab_bloc.dart';
import 'confirm_delete_button.dart';

class LongpressPopupMenu {
  void showDropDownMenu(
      BuildContext context, ScriptModel script, LongPressStartDetails details) {
    final RenderBox? box = context.findAncestorRenderObjectOfType<RenderBox>();
    if (box == null) return;

    final Offset globalPosition = details.globalPosition;

    showMenu(
      context: context,
      color: Theme.of(context).colorScheme.onSecondary,
      position: RelativeRect.fromRect(
        Rect.fromLTWH(
          globalPosition.dx,
          globalPosition.dy,
          0,
          0,
        ),
        Offset.zero & Size.infinite,
      ),
      items: [
        PopupMenuItem(
          child: ListTile(
            leading: const Icon(Icons.ios_share),
            title: Text(
              'Export',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontFamily: "Zain"),
            ),
            onTap: () {
              Navigator.pop(context);
              _showExportSubMenu(context, globalPosition, script);
            },
          ),
        ),
        PopupMenuItem(
          child: ListTile(
            leading: const Icon(Icons.delete, color: Colors.red),
            title: const Text('Delete',
                style: TextStyle(color: Colors.red, fontFamily: "Zain")),
            onTap: () {
              Navigator.pop(context);
              _showDeleteConfirmation(context, script.id);
            },
          ),
        ),
      ],
    );
  }

  void _showExportSubMenu(
      BuildContext context, Offset position, ScriptModel script) {
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;
    final adjustedPosition = position.translate(overlay.size.width * 0.4, 0);

    showMenu(
      color: Theme.of(context).colorScheme.onSecondary,
      context: context,
      position: RelativeRect.fromLTRB(
        adjustedPosition.dx,
        adjustedPosition.dy,
        adjustedPosition.dx + 100,
        adjustedPosition.dy + 100,
      ),
      items: [
        PopupMenuItem(
          child: ListTile(
            leading: const Icon(Icons.text_snippet),
            title: Text(
              'Plain Text',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontFamily: "Zain"),
            ),
            onTap: () async {
              Navigator.pop(context);
              await _exportAsPlainText(context, script);
            },
          ),
        ),
      ],
    );
  }

  Future<void> _exportAsPlainText(
      BuildContext context, ScriptModel script) async {
    if (Platform.isAndroid) {
      final status = await Permission.storage.request();
      if (!status.isGranted) {
        _showError(context, 'Storage permission denied');
        return;
      }
    }

    try {
      final String? outputPath = await FilePicker.platform.saveFile(
        dialogTitle: 'Save Script',
        fileName: '${script.title.replaceAll(' ', '_')}.txt',
        type: FileType.custom,
        allowedExtensions: ['txt'],
        lockParentWindow: true,
      );

      if (outputPath != null) {
        final File file = File(outputPath);
        await file.writeAsString('${script.title}\n\n${script.content}');
        _showSuccess(context, 'File saved successfully!');
      }
    } catch (e) {
      _showError(context, 'Failed to save file: ${e.toString()}');
    }
  }

  void _showSuccess(BuildContext context, String message) {
    Flushbar(
      backgroundColor: Colors.green,
      message: message,
      icon: const Icon(Icons.error_outline, color: Colors.white),
      duration: const Duration(seconds: 3),
      messageColor: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(8.r)),
      flushbarPosition: FlushbarPosition.TOP,
    ).show(context);
  }

  void _showError(BuildContext context, String message) {
    Flushbar(
      backgroundColor: Colors.red.shade600,
      message: message,
      icon: const Icon(Icons.error_outline, color: Colors.white),
      duration: const Duration(seconds: 3),
      messageColor: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(8.r)),
      flushbarPosition: FlushbarPosition.TOP,
    ).show(context);
  }

  // Delete confirmation dialog
  void _showDeleteConfirmation(BuildContext context, String scriptId) {
    ConfirmDeleteButton().showAwesomeDialog(
        context,
        'Delete Script',
        TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        'Are you sure you want to permanently delete this script?',
        'Cancel',
        Colors.red,
        'Delete',
        DialogType.question, () {
      context.read<ScriptBloc>().add(DeleteScriptEvent(scriptId));
      context.go('/');
    }, () {
      context.go('/');
    });
  }
}
