import 'package:flutter/material.dart';

import '../../views/Home/Tab/Screens/Scripts_tab/widget/customanimation.dart';
import 'widget/buttons_for_pop_up.dart';

class AddbyPopupCard extends StatelessWidget {
  const AddbyPopupCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Semi-transparent background
        Container(
          color: Colors.black
              .withOpacity(0.5), // Black background with 50% opacity
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: Hero(
              tag: "heroAddTodo", // Match the tag from the Scripts class
              createRectTween: (begin, end) {
                return CustomRectTween(
                  begin: begin ?? Rect.zero,
                  end: end ?? Rect.zero,
                );
              },
              child: SingleChildScrollView(
                child: Card(
                  color: Colors.white,
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        ButtonsForPopUp(
                          icon_Name: Icons.text_snippet_rounded,
                          title: "Create Script",
                        ),
                        SizedBox(height: 8), // Added spacing
                        ButtonsForPopUp(
                          icon_Name: Icons.auto_awesome,
                          title: "Generate Script using AI",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
