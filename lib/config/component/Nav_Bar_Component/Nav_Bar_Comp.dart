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
    AddScript(),
    Setting(),
  ];
}

// Nav Bar Components
List<PersistentBottomNavBarItem> navBarItems() {
  return [
    PersistentBottomNavBarItem(
      iconSize: 30,
      icon: Icon(Icons.home),
      activeColorPrimary: Colors.yellow,
      inactiveColorPrimary: Colors.black,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(
        Icons.add,
        color: Colors.black,
      ),
      iconSize: 30,
      activeColorPrimary: Colors.yellow,
      inactiveColorPrimary: Colors.black,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.settings),
      iconSize: 30,
      activeColorPrimary: Colors.yellow,
      inactiveColorPrimary: Colors.black,
    ),
  ];
}
