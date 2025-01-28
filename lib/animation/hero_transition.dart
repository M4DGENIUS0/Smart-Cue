// animations/hero_transition.dart
import 'package:flutter/material.dart';

class HeroTransition extends StatelessWidget {
  final Widget child;
  final String tag;
  const HeroTransition({super.key, required this.tag, required this.child});

  @override
  Widget build(BuildContext context) {
    return Hero(tag: tag, child: child);
  }
}
