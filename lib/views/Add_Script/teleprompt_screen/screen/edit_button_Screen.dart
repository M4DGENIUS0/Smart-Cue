import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartcue/views/Add_Script/teleprompt_screen/bloc/smart_Cue/smart_cue_bloc.dart';

class Edit_Screen extends StatefulWidget {
  const Edit_Screen({super.key});

  @override
  State<Edit_Screen> createState() => _Edit_ScreenState();
}

class _Edit_ScreenState extends State<Edit_Screen> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
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
              onPressed: () {},
              child: Icon(
                Icons.done,
                size: 25,
                color: Colors.white,
              )),
        ],
      ),
      body: TextField(
        keyboardType: TextInputType.multiline,
        onChanged: (text) {
          context.read<SmartCueBloc>().add(EditTextEvent(text));
        },
        decoration: InputDecoration(border: InputBorder.none),
        maxLines: 9999,
      ),
    );
  }
}
