import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smartcue/views/Add_Script/teleprompt_screen/bloc/smart_Cue/smart_cue_bloc.dart';
import 'package:smartcue/views/Add_Script/teleprompt_screen/widget/widget.dart';

import '../../../../extension/dialog_box/custom_dialog_box.dart';
import '../bloc/Playback/playback_bloc.dart';

class EditScreen extends StatefulWidget {
  final String? scriptId;
  final String initialTitle;
  final String initialContent;
  const EditScreen(
      {super.key,
      this.scriptId,
      this.initialTitle = '',
      this.initialContent = ''});

  @override
  State<EditScreen> createState() => EditScreenState();
}

class EditScreenState extends State<EditScreen> {
  @override
  void initState() {
    super.initState();
    if (widget.scriptId != null) {
      context
          .read<SmartCueBloc>()
          .add(LoadExistingScriptEvent(widget.scriptId!));
    } else {
      context.read<SmartCueBloc>().titleController.text = widget.initialTitle;
      context.read<SmartCueBloc>().contentController.text =
          widget.initialContent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              context.go('/');
            },
            child: Icon(
              Icons.close,
              color: Theme.of(context).colorScheme.onPrimary,
            )),
        actions: [
          TextButton(
              onPressed: () {
                CustomDialogBox().showAwesomeDialog(
                    context, NameofFile(), DialogType.warning, () {
                  context.go('/Add_Script/teleprompt_screen/Edit_Screen');
                }, () {
                  _saveScript(context);
                  if (mounted) {
                    context.go('/');
                  }
                  context.read<SmartCueBloc>().add(ClearTextEvent());
                });
              },
              child: Icon(
                Icons.done,
                size: 25,
                color: Theme.of(context).colorScheme.onPrimary,
              )),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<PlaybackBloc, PlaybackState>(
              builder: (context, state) {
                return TextField(
                  controller: context.read<SmartCueBloc>().contentController,
                  style: TextStyle(
                      fontSize: state.textSize,
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontFamily: "Zain"),
                  decoration: const InputDecoration(border: InputBorder.none),
                  maxLines: 9999,
                );
              },
            ),
          ),
          BottomTextSizeForEditScreen()
        ],
      ),
    );
  }

  void _saveScript(BuildContext context) {
    final bloc = context.read<SmartCueBloc>();
    final isEditing = widget.scriptId != null;

    bloc.add(SaveTextEvent(
      id: widget.scriptId,
      title: bloc.titleController.text,
      content: bloc.contentController.text,
    ));

    if (isEditing) {
      context.go('/');
    } else {
      context.go('/Add_Script/teleprompt_screen/');
    }

    bloc.add(ClearTextEvent());
  }
}
