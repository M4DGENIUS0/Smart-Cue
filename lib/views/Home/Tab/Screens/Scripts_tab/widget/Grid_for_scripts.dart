import 'package:flutter/material.dart';

class GridForScripts extends StatelessWidget {
  final String title;
  const GridForScripts({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: Colors.black, width: 1),
          color: Colors.yellow[100]),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(title),
      ),
    );
  }
}
