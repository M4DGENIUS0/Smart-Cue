import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/smart_Cue/smart_cue_bloc.dart';

class NameofFile extends StatefulWidget {
  const NameofFile({super.key});

  @override
  State<NameofFile> createState() => _NameofFileState();
}

class _NameofFileState extends State<NameofFile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5,
      children: [
        Text("Name your script"),
        TextField(
          controller: context.read<SmartCueBloc>().titleController,
          decoration: InputDecoration(
              hintText: "Name of the file",
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  borderSide:
                      BorderSide(color: Colors.amber.shade600, width: 1)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  borderSide: BorderSide(color: Colors.black, width: 1))),
        ),
      ],
    );
  }
}
