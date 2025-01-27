import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as p;
part 'smart_cue_event.dart';
part 'smart_cue_state.dart';

class SmartCueBloc extends Bloc<SmartCueEvent, SmartCueState> {
  SmartCueBloc() : super(const SmartCueState(text: '')) {
    on<EditTextEvent>((event, emit) {
      emit(state.copyWith(text: event.text));
    });

    on<SaveTextEvent>((event, emit) async {
      final pdf = p.Document();
      pdf.addPage(
        p.Page(
          build: (p.Context context) => p.Center(
            child: p.Text(state.text),
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
}
