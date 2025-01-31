import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'widget_for_bottom_Sheet/widget.dart';

class GenerateScriptBottomSheet {
  void openBottomSheet(
    BuildContext context,
  ) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).colorScheme.secondary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.r),
        ),
      ),
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SizedBox(
          height: 800.h,
          child: Padding(
            padding: EdgeInsets.all(8.0.r),
            child: SingleChildScrollView(
              child: Column(
                spacing: 10,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      color: Theme.of(context).colorScheme.onPrimary,
                      onPressed: () {
                        while (context.canPop()) {
                          context.pop();
                        }
                        context.go('/');
                      },
                      icon: Icon(
                        Icons.close,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ),
                  TemplateButtons(),
                  DescriptionBox(),
                  ToneOfVoice(),
                  Languages(),
                  SizedBox(
                    height: 50.h,
                  ),
                  ButtonForGeneration(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
