import 'package:flutter/material.dart';
import 'package:smartcue/views/views.dart';

class EmptyScripts extends StatelessWidget {
  const EmptyScripts({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isLandscape = constraints.maxWidth > constraints.maxHeight;

        return Center(child: isLandscape ? LandscapeEmpty() : PortraitEmpty());
      },
    );
  }
}
