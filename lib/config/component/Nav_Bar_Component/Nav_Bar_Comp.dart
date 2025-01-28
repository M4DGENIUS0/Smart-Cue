import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:smartcue/views/views.dart';

// Scroll Controller
final List<ScrollController> _scrollControllers = [
  ScrollController(),
  ScrollController(),
];

// build Screen
List<Widget> buildScreens() {
  return [
    ScriptsHome(),
    Setting(),
  ];
}

// Nav Bar Components
List<PersistentBottomNavBarItem> navBarItems(BuildContext context) {
  return [
    PersistentBottomNavBarItem(
      iconSize: 30,
      icon: Icon(
        Icons.home,
        color: Theme.of(context).primaryColorDark,
      ),
      inactiveIcon: Icon(
        Icons.home,
        color: Theme.of(context).colorScheme.onPrimary,
      ),
      activeColorPrimary: Theme.of(context).colorScheme.primary,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(
        Icons.settings,
        color: Theme.of(context).primaryColorDark,
      ),
      iconSize: 30,
      activeColorPrimary: Theme.of(context).colorScheme.primary,
      inactiveIcon: Icon(
        Icons.settings,
        color: Theme.of(context).colorScheme.onPrimary,
      ),
    ),
  ];
}
