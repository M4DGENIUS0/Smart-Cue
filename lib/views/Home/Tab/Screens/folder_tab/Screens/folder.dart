import 'package:flutter/material.dart';

import '../../../../../views.dart';

class folderTab extends StatelessWidget {
  const folderTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.builder(
          physics: BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 120,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1,
          ),
          itemCount: 1, // Currently displaying 1 item
          itemBuilder: (context, index) {
            return GridForFolderTab();
          },
        ));
  }
}
