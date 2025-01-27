import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartcue/views/Add_Script/teleprompt_screen/bloc/smart_Cue/smart_cue_bloc.dart';
import 'package:smartcue/views/Add_Script/teleprompt_screen/widget/widget.dart';
import 'package:smartcue/views/views.dart';

import '../../../../extension/dialog_box/custom_dialog_box.dart';
import '../../../../repository/script repo/hive_script_repo.dart';
import '../bloc/Playback/playback_bloc.dart';

class Create_Edit_Screen extends StatefulWidget {
  const Create_Edit_Screen({super.key});

  @override
  State<Create_Edit_Screen> createState() => _Create_Edit_ScreenState();
}

class _Create_Edit_ScreenState extends State<Create_Edit_Screen> {
  @override
  // void dispose() {
  //   context.read<SmartCueBloc>().close();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        leading: InkWell(
            onTap: () {
              // Add your navigation logic here
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.close,
              color: Colors.white,
            )),
        actions: [
          TextButton(
              onPressed: () {
                CustomDialogBox().showAwesomeDialog(
                    context, NameofFile(), DialogType.warning, () {
                  Navigator.of(context).pop();
                  context.read<SmartCueBloc>().add(ClearTextEvent());
                }, () {
                  context.read<SmartCueBloc>().add(SaveTextEvent(
                      title: context.read<SmartCueBloc>().titleController.text,
                      content:
                          context.read<SmartCueBloc>().contentController.text));
                  if (mounted) {
                    // Perform actions like navigation only if the widget is still mounted
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InitHome(),
                      ),
                      (Route<dynamic> route) => false,
                    );
                  }
                  context.read<SmartCueBloc>().add(ClearTextEvent());
                });
              },
              child: Icon(
                Icons.done,
                size: 25,
                color: Colors.white,
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
                  style: TextStyle(fontSize: state.textSize),
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
