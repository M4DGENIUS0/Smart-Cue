import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smartcue/views/Add_Script/teleprompt_screen/bloc/smart_Cue/smart_cue_bloc.dart';
import 'package:smartcue/views/Add_Script/teleprompt_screen/widget/widget.dart';

import '../../../../extension/dialog_box/custom_dialog_box.dart';
import '../bloc/Playback/playback_bloc.dart';

class Create_Screen extends StatefulWidget {
  const Create_Screen({super.key});

  @override
  State<Create_Screen> createState() => _Create_ScreenState();
}

class _Create_ScreenState extends State<Create_Screen> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              context.go('/');
              context.read<SmartCueBloc>().add(ClearTextEvent());
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
                  context
                      .go('/Add_Script/teleprompt_screen/Create_Edit_Screen');
                }, () {
                  context.read<SmartCueBloc>().add(SaveTextEvent(
                      title: context.read<SmartCueBloc>().titleController.text,
                      content:
                          context.read<SmartCueBloc>().contentController.text));

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
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(border: InputBorder.none),
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
}
