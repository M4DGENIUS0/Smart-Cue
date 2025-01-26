import 'package:flutter/material.dart';

class ButtonsForPopUp extends StatelessWidget {
  final IconData icon_Name;
  final String title;
  const ButtonsForPopUp(
      {super.key, required this.icon_Name, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 350,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: Colors.black)),
      child: Row(
        spacing: 5,
        children: [
          Flexible(
            child: Icon(
              icon_Name,
            ),
          ),
          Flexible(
              child: Text(
            title,
            softWrap: true,
          ))
        ],
      ),
    );
  }
}
