import 'package:flutter/material.dart';
import 'package:smartcue/views/views.dart';

import 'widget/bottom_Sheet.dart';
import 'widget/buttons_for_pop_up.dart';

class AddbyPopupCard extends StatelessWidget {
  const AddbyPopupCard({super.key});

  @override
  Widget build(BuildContext context) {
    void cancel() {
      Navigator.pop(context);
    }

    return AlertDialog(
      title: Text(
        "Script builder",
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
              openBottomSheet(context);
            },
            child: ButtonsForPopUp(
              icon_Name: Icons.text_snippet_rounded,
              title: "Create Script",
            ),
          ),
          SizedBox(height: 8), // Added spacing
          ButtonsForPopUp(
            icon_Name: Icons.auto_awesome,
            title: "Generate Script using AI",
          ),
        ],
      ),
      actions: [TextButton(onPressed: cancel, child: Text("cancel"))],
    );
  }
}
