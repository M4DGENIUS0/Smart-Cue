import 'package:flutter/material.dart';

class GridForFolderTab extends StatelessWidget {
  const GridForFolderTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 70,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: Colors.black, width: 1),
          color: Colors.yellow[100]),
      child: Icon(
        Icons.folder,
        size: 50,
        color: Colors.black,
      ),
    );
  }
}
