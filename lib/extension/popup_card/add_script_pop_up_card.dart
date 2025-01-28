import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:smartcue/views/views.dart';

import '../../views/Add_Script/Bottom_Sheet/bottom_Sheet.dart';

class PopupDialogBox {
  void showAwesomeDialog(
    BuildContext context,
  ) {
    AwesomeDialog(
      context: context,
      reverseBtnOrder: true,
      dialogBackgroundColor: Theme.of(context).colorScheme.onSecondary,
      dialogType: DialogType.question,
      animType: AnimType.topSlide,
      title: "Script builder",
      titleTextStyle: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
      buttonsTextStyle: TextStyle(
          color: Theme.of(context).colorScheme.onPrimary, fontSize: 18),
      showCloseIcon: true,
      btnCancelColor: Theme.of(context).colorScheme.primary,
      btnOkColor: Theme.of(context).colorScheme.primary,
      btnCancelOnPress: () {
        Navigator.of(context).pop();
        openBottomSheet(context);
      },
      btnOkText: "Create Script",
      btnCancelText: "Generate AI",
      btnOkOnPress: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Create_Edit_Screen(),
            ));
      },
    ).show();
  }
}
