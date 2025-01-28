import 'package:flutter/material.dart';
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
