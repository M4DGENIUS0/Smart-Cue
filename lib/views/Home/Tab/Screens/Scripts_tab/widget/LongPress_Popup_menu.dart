import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../extension/dialog_box/custom_dialog_box.dart';
import '../../../../../../model/script_model.dart';
import '../../../../../../utils/Status/ExportFormat.dart';
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
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
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
            title: const Text('Delete', style: TextStyle(color: Colors.red)),
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
    String exportAsPlainText(ScriptModel script) {
      // Implement your plain text export logic here
      final content = '${script.title}\n\n${script.content}';
      return content;
      // Example: Share.share(content);
    }

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
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            ),
            onTap: () {
              Navigator.pop(context);
              exportAsPlainText(script);
            },
          ),
        ),
      ],
    );
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
