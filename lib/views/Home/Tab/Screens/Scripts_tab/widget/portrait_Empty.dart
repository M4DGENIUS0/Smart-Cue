import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartcue/utils/assets.dart';

class PortraitEmpty extends StatelessWidget {
  const PortraitEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 10,
      children: [
        SizedBox(
          height: 30.h,
        ),
        Image.asset(
          assets.nofile,
          height: 200.h,
        ),
        Text(
          "Oops! Your script list is empty 📜",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30.sp,
            fontWeight: FontWeight.bold,
            fontFamily: "Zain",
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        Text(
          "Start by tapping the button to create one!",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18.sp,
            color: Theme.of(context).colorScheme.onPrimary,
            fontFamily: "Zain",
          ),
        ),
      ],
    );
  }
}
