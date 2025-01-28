import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class CustomDialogBox {
  void showAwesomeDialog(
    BuildContext context,
    Widget child,
    DialogType dialogType,
    void Function()? cancel,
    void Function()? ok,
  ) {
    AwesomeDialog(
      context: context,
      dialogType: dialogType,
      animType: AnimType.topSlide,
      body: child,
      dialogBackgroundColor: Theme.of(context).colorScheme.onSecondary,
      buttonsTextStyle:
          TextStyle(color: Theme.of(context).colorScheme.onPrimary),
      showCloseIcon: true,
      btnCancelColor: Colors.amber.shade600,
      btnOkColor: Colors.amber.shade600,
      btnCancelOnPress: cancel,
      btnOkOnPress: ok,
    ).show();
  }
}
