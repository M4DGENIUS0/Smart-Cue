import 'package:flutter/material.dart';

import '../../../../../../extension/hero-tags/tags.dart';
import '../../../../../../extension/popup_card/add_script_pop_up_card.dart';
import '../../../../../../extension/popup_card/widget/buttons_for_pop_up.dart';
import '../../../../../views.dart';
import '../widget/customanimation.dart';
import '../widget/heroDialogRoute.dart';

class Scripts extends StatelessWidget {
  const Scripts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: GestureDetector(
        // backgroundColor: Colors.yellowAccent,
        onTap: () {
          Navigator.of(context)
              .push(HeroDialogRoute(builder: (BuildContext context) {
            return AddbyPopupCard();
          }));
        },
        child: Hero(
          tag: "heroAddTodo",
          createRectTween: (begin, end) {
            return CustomRectTween(
                begin: begin ?? Rect.zero, end: end ?? Rect.zero);
          },
          child: Material(
            color: Colors.amberAccent,
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            child: const Icon(
              Icons.add_rounded,
              size: 56,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 120,
            mainAxisExtent: 150, // Adjust size as needed
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1,
          ),
          itemCount: 1, // Currently displaying 1 item
          itemBuilder: (context, index) {
            return GridForScripts(
              title: 'Demo',
            );
          },
        ),
      ),
    );
  }
}
