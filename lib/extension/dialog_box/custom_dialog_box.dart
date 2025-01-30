import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartcue/views/Add_Script/Bottom_Sheet/bloc/generation_bloc.dart';

import '../../utils/Status/GenerationStatus.dart';

class CustomDialogBox {
  void showAwesomeDialog(
    BuildContext context,
    Widget? child,
    DialogType dialogType,
    void Function()? cancel,
    void Function()? ok,
  ) {
    final state = context.read<GenerationBloc>().state; // Get the current state

    AwesomeDialog(
      context: context,
      dialogType: dialogType,
      animType: AnimType.topSlide,
      body: child,
      dialogBackgroundColor: Theme.of(context).colorScheme.onSecondary,
      buttonsTextStyle: TextStyle(
        color: Theme.of(context).colorScheme.onPrimary,
      ),
      showCloseIcon: true,
      btnCancelColor: Theme.of(context).colorScheme.primary,
      btnOkColor: Theme.of(context).colorScheme.primary,
      btnCancelOnPress: cancel,
      btnOkOnPress: ok,
      btnOkText: state.status == GenerationStatus.loading
          ? null // Hide text if loading
          : "Ok",
      btnOk: state.status == GenerationStatus.loading
          ? CircularProgressIndicator(
              color: Theme.of(context).colorScheme.onPrimary,
            )
          : null, // Show loading indicator instead of the button
    ).show();
  }
}
