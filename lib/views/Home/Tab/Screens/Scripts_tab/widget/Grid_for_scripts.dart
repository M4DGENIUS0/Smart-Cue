import 'package:flutter/material.dart';

class GridForScripts extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const GridForScripts({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: Colors.black, width: 1),
            color: Colors.yellow[100]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            overflow: TextOverflow.ellipsis,
            maxLines: 5,
          ),
        ),
      ),
    );
  }
}
