import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartcue/utils/assets.dart';

class EmptyScripts extends StatelessWidget {
  const EmptyScripts({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        spacing: 10,
        children: [
          SizedBox(
            height: 30,
          ),
          Image.asset(
            assets.nofile,
            height: 150,
          ),
          Text(
            "Oops! Your script list is empty 📜",
            style: TextStyle(
                fontSize: 25.sp,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onPrimary),
          ),
          Text(
            "Start by tapping the button to create one!",
            style: TextStyle(
                fontSize: 18.sp,
                color: Theme.of(context).colorScheme.onPrimary),
          )
        ],
      ),
    );
  }
}
