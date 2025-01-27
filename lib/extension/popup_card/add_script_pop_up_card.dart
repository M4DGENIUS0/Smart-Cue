import 'package:flutter/material.dart';
import 'package:smartcue/views/views.dart';

import '../../views/Add_Script/Bottom_Sheet/bottom_Sheet.dart';
import 'widget/buttons_for_pop_up.dart';

class AddbyPopupCard extends StatefulWidget {
  const AddbyPopupCard({super.key});

  @override
  State<AddbyPopupCard> createState() => _AddbyPopupCardState();
}

class _AddbyPopupCardState extends State<AddbyPopupCard> {
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
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Create_Edit_Screen(),
                  ));
            },
            child: ButtonsForPopUp(
              icon_Name: Icons.text_snippet_rounded,
              title: "Create Script",
            ),
          ),
          SizedBox(height: 8), // Added spacing
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
              if (mounted) {
                openBottomSheet(context);
              }
            },
            child: ButtonsForPopUp(
              icon_Name: Icons.auto_awesome,
              title: "Generate Script using AI",
            ),
          ),
        ],
      ),
      actions: [TextButton(onPressed: cancel, child: Text("cancel"))],
    );
  }
}
