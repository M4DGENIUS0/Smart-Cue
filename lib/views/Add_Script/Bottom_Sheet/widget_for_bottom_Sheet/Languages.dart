import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartcue/views/Add_Script/Bottom_Sheet/bloc/generation_bloc.dart';

import '../../../../config/component/generate_by_ai_components/BottomSheet_Components.dart';

class Languages extends StatelessWidget {
  const Languages({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Languages",
          style: TextStyle(
              fontSize: 26.sp,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onPrimary,
              fontFamily: "Zain"),
        ),
        SizedBox(height: 10.h),
        BlocBuilder<GenerationBloc, GenerationState>(
          builder: (context, state) {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              child: Row(
                spacing: 5,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: Language_Option.map((option) {
                  final isSelected = state.language == option;
                  return GestureDetector(
                    onTap: () {
                      context
                          .read<GenerationBloc>()
                          .add(UpdateLanguage(option));
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.onSecondary,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Text(
                        option,
                        style: TextStyle(
                            color: isSelected
                                ? Colors.black
                                : Theme.of(context).colorScheme.onPrimary,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                            fontFamily: "Zain"),
                      ),
                    ),
                  );
                }).toList(),
              ),
            );
          },
        ),
      ],
    );
  }
}
