import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartcue/utils/assets.dart';

class LandscapeEmpty extends StatelessWidget {
  const LandscapeEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          assets.nofile,
          height: 150.h,
        ),
        SizedBox(width: 20.w),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Oops! Your script list is empty 📜",
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                fontFamily: "Zain",
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              "Start by tapping the button to create one!",
              style: TextStyle(
                fontSize: 16.sp,
                color: Theme.of(context).colorScheme.onPrimary,
                fontFamily: "Zain",
              ),
            ),
          ],
        ),
      ],
    );
  }
}
