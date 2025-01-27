import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as p;
import 'package:uuid/uuid.dart';

import '../../../../../model/script_model.dart';
import '../../../../../repository/script repo/hive_script_repo.dart';
part 'smart_cue_event.dart';
part 'smart_cue_state.dart';

class SmartCueBloc extends Bloc<SmartCueEvent, SmartCueState> {
  final TextEditingController contentController = TextEditingController();
  final TextEditingController titleController = TextEditingController();

  final HiveScriptRepository scriptRepository = HiveScriptRepository();
  SmartCueBloc() : super(const SmartCueState()) {
    on<SaveTextEvent>((event, emit) async {
      titleController.text = event.title;
      contentController.text = event.content;
      if (contentController.text.isNotEmpty) {
        final newScript = ScriptModel(
          id: const Uuid().v4(),
          title: titleController.text,
          content: contentController.text,
          isGenerated: false,
          createdAt: DateTime.now(),
        );

        await scriptRepository.addScript(newScript);
      }
    });
    on<ClearTextEvent>((event, emit) {
      titleController.clear();
      contentController.clear();
    });

    on<SaveTextToPDFEvent>((event, emit) async {
      final pdf = p.Document();
      pdf.addPage(
        p.Page(
          build: (p.Context context) => p.Center(
            child: p.Text(state.content),
          ),
        ),
      );

      try {
        final directory = await getExternalStorageDirectory();
        final name = DateTime.now().millisecondsSinceEpoch.toString();
        final file = File('${directory!.path}/$name.pdf');
        await file.writeAsBytes(await pdf.save());
      } catch (e) {
        print("Error: $e");
      }
    });
  }
  @override
  Future<void> close() {
    titleController.dispose();
    contentController.dispose();
    return super.close();
  }
}
