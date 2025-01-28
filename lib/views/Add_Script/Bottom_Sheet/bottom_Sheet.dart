import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'widget_for_bottom_Sheet/widget.dart';

void openBottomSheet(
  BuildContext context,
) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      ),
    ),
    isScrollControlled: true,
    builder: (BuildContext context) {
      return FractionallySizedBox(
        heightFactor: 0.9, // 90% of the screen height
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              spacing: 10,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () {
                      context.go('/');
                    },
                    icon: const Icon(Icons.close),
                  ),
                ),
                TemplateButtons(),
                DescriptionBox(),
                ToneOfVoice(),
                Languages(),
                SizedBox(
                  height: 60,
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
