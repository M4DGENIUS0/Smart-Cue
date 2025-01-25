import 'package:flutter/cupertino.dart';
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
      icon: Icon(Icons.home),
      title: "Script",
      activeColorPrimary: Colors.blue,
      inactiveColorPrimary: Colors.grey,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.search),
      title: "Add",
      activeColorPrimary: Colors.green,
      inactiveColorPrimary: Colors.grey,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.person),
      title: "Setting",
      activeColorPrimary: Colors.purple,
      inactiveColorPrimary: Colors.grey,
    ),
  ];
}
