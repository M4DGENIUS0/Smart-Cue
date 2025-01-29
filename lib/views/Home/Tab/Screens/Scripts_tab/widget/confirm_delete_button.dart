import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class ConfirmDeleteButton {
  void showAwesomeDialog(
    BuildContext context,
    String title,
    TextStyle textStyle,
    String description,
    String OkbuttonText,
    Color cancelButtonColor,
    String cancelbuttonText,
    DialogType dialogType,
    void Function()? cancel,
    void Function()? ok,
  ) {
    AwesomeDialog(
      context: context,
      title: title,
      titleTextStyle: textStyle,
      desc: description,
      descTextStyle: textStyle,
      btnOkText: OkbuttonText,
      btnCancelText: cancelbuttonText,
      dialogType: dialogType,
      animType: AnimType.topSlide,
      dialogBackgroundColor: Theme.of(context).colorScheme.onSecondary,
      buttonsTextStyle:
          TextStyle(color: Theme.of(context).colorScheme.onPrimary),
      showCloseIcon: true,
      btnCancelColor: cancelButtonColor,
      btnOkColor: Theme.of(context).colorScheme.primary,
      btnCancelOnPress: cancel,
      btnOkOnPress: ok,
    ).show();
  }
}
