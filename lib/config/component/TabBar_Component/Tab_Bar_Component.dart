import 'package:flutter/material.dart';

import '../../../views/views.dart';

class TabBarComponent extends StatelessWidget {
  const TabBarComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [Scripts(), folderTab(), ImportTab()],
    );
  }
}
