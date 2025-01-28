import 'package:flutter/material.dart';

class GridForScripts extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onTap;
  const GridForScripts(
      {super.key,
      required this.title,
      required this.onTap,
      required this.content});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: Colors.black, width: 1),
            color: Theme.of(context).colorScheme.onSecondary),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 100,
                color: Colors.yellow[100],
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      content,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 5,
                      style: TextStyle(fontSize: 8),
                    ),
                  ),
                ),
              ),
              Text(
                title,
                overflow: TextOverflow.ellipsis,
                style:
                    TextStyle(color: Theme.of(context).colorScheme.onPrimary),
              )
            ],
          ),
        ),
      ),
    );
  }
}
