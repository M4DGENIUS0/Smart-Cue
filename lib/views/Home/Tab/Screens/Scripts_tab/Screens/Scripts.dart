import 'package:flutter/material.dart';

import '../../../../../views.dart';

class Scripts extends StatelessWidget {
  const Scripts({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
