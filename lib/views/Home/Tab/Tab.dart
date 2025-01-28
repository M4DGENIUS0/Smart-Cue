import 'package:flutter/material.dart';

class Tabs extends StatelessWidget {
  const Tabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TabBar(
          indicatorSize: TabBarIndicatorSize.tab,
          dividerColor: Colors.transparent,
          indicator: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              border: Border.all(
                  color: Theme.of(context).colorScheme.onPrimary, width: 1),
              borderRadius: BorderRadius.circular(10)),
          labelColor: Colors.black,
          unselectedLabelColor: Theme.of(context).colorScheme.onPrimary,
          tabs: [
            Tab(
              child: Center(
                  child: Text(
                "Script",
                overflow: TextOverflow.ellipsis,
              )),
            ),
            Tab(
              child: Center(
                  child: Text(
                "Folder",
                overflow: TextOverflow.ellipsis,
              )),
            ),
            Tab(
              child: Center(
                  child: Text(
                "Import",
                overflow: TextOverflow.ellipsis,
              )),
            )
          ]),
    );
  }
}
