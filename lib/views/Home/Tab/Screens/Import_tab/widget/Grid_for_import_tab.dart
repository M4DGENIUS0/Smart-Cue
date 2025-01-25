import 'package:flutter/material.dart';

class GridForImportTab extends StatelessWidget {
  const GridForImportTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: Colors.black, width: 1),
            color: Colors.yellow[100]),
        child: Icon(
          Icons.file_open,
          size: 50,
          color: Colors.black,
        ),
      ),
    );
  }
}
