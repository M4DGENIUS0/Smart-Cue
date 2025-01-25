import 'package:flutter/material.dart';

class ScriptsHome extends StatefulWidget {
  const ScriptsHome({super.key});

  @override
  State<ScriptsHome> createState() => _ScriptsHomeState();
}

class _ScriptsHomeState extends State<ScriptsHome> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Icon(
        Icons.home,
        size: 50,
      ),
    );
  }
}
