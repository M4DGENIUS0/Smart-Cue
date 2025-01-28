import 'package:flutter/material.dart';

import '../Controller/Screen_Scroll_Helper.dart';
import 'widget.dart';

class PlayBackMenu extends StatelessWidget {
  final ScrollHelper scrollHelper;
  const PlayBackMenu({
    super.key,
    required this.scrollHelper,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      color: Theme.of(context).appBarTheme.backgroundColor,
      child: Row(
        spacing: 5,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings),
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          PlayPauseButton(
            scrollHelper: scrollHelper,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.access_time_rounded),
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          PopupSizeButton()
        ],
      ),
    );
  }
}
