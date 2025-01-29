import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/generation_bloc.dart';

class DescriptionBox extends StatelessWidget {
  const DescriptionBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Description",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: 350,
          child: TextField(
            keyboardType: TextInputType.multiline,
            maxLines: null,
            minLines: 5,
            onChanged: (value) {
              context.read<GenerationBloc>().add(UpdateDescription(value));
              print(value);
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Enter description",
            ),
          ),
        )
      ],
    );
  }
}
