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
      color: Colors.grey[900],
      child: Row(
        spacing: 5,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings),
            color: Colors.white,
          ),
          PlayPauseButton(
            scrollHelper: scrollHelper,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.access_time_rounded),
            color: Colors.white,
          ),
          PopupSizeButton()
        ],
      ),
    );
  }
}
