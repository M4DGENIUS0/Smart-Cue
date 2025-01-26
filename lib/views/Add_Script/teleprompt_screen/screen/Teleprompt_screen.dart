import 'package:flutter/material.dart';

class SmartCueScreen extends StatefulWidget {
  const SmartCueScreen({super.key});

  @override
  State<SmartCueScreen> createState() => _SmartCueScreenState();
}

class _SmartCueScreenState extends State<SmartCueScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(),
          Expanded(
              child: Column(
            children: [],
          ))
        ],
      ),
    );
  }
}
