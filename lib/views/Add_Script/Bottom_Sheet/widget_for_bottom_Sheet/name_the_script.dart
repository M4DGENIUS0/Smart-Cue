import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/generation_bloc.dart';

class NameTheScript extends StatefulWidget {
  const NameTheScript({super.key});

  @override
  State<NameTheScript> createState() => _NameTheScriptState();
}

class _NameTheScriptState extends State<NameTheScript> {
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5,
      children: [
        Text(
          "Name your script",
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
        TextField(
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
          controller: context.read<GenerationBloc>().fileName,
          decoration: InputDecoration(
              hintText: "Name of the file",
              hintStyle:
                  TextStyle(color: Theme.of(context).colorScheme.onPrimary),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.r)),
                  borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary, width: 1)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.r)),
                  borderSide: BorderSide(color: Colors.black, width: 1))),
        ),
      ],
    );
  }
}
