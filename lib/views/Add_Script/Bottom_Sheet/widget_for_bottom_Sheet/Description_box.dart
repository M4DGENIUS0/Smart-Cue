import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onPrimary),
        ),
        SizedBox(
          width: 450.w,
          child: TextField(
            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            onTapOutside: (v) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            controller: context.read<GenerationBloc>().descriptionController,
            onChanged: (value) {
              context.read<GenerationBloc>().add(UpdateDescription(value));
            },
            keyboardType: TextInputType.multiline,
            maxLines: null,
            minLines: 5,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.onPrimary,
                        width: 1)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.onPrimary,
                        width: 1)),
                hintText: "Enter description",
                hintStyle:
                    TextStyle(color: Theme.of(context).colorScheme.onPrimary)),
          ),
        )
      ],
    );
  }
}
