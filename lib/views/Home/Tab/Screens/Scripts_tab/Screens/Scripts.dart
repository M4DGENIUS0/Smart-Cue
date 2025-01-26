import 'package:flutter/material.dart';
import 'package:smartcue/extension/popup_card/add_script_pop_up_card.dart';

import '../../../../../views.dart';

class Scripts extends StatelessWidget {
  const Scripts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: GestureDetector(
        // backgroundColor: Colors.yellowAccent,
        onTap: () {
          showDialog(
              context: context,
              builder: (BuildContext context) => AddbyPopupCard());
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
