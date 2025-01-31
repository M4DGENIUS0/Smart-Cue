import 'package:another_flushbar/flushbar.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smartcue/views/Add_Script/Bottom_Sheet/bloc/generation_bloc.dart';

import '../../../../extension/dialog_box/custom_dialog_box.dart';
import '../../../../extension/flush_bar/Error_FlushBar.dart';
import '../../../../utils/Status/GenerationStatus.dart';
import 'widget.dart';

class ButtonForGeneration extends StatelessWidget {
  const ButtonForGeneration({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<GenerationBloc, GenerationState>(
      listener: (context, state) {
        if (state.status == GenerationStatus.success) {
          _showSuccessMessage(context);
          print("Discription: ${state.description.toString()}");
          print("Title: ${state..toString()}");
        } else if (state.status == GenerationStatus.error) {
          ErrorFlushbar().showErrorFlushbar(state.errormessage, context);
          context.read<GenerationBloc>().add(ResetState());
          context.read<GenerationBloc>().add(ClearTextField());
        }
      },
      child: SizedBox(
        height: 60.h,
        width: 400.w,
        child: BlocBuilder<GenerationBloc, GenerationState>(
          builder: (context, state) {
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.r))),
                  backgroundColor: Theme.of(context).colorScheme.primary),
              onPressed: state.status == GenerationStatus.loading
                  ? null
                  : () {
                      _showSaveFileDialog(context);
                    },
              child: state.status == GenerationStatus.loading
                  ? CircularProgressIndicator(
                      color: Theme.of(context).colorScheme.onPrimary,
                    )
                  : Text(
                      "Generate Script",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25.sp,
                          fontFamily: "Zain"),
                    ),
            );
          },
        ),
      ),
    );
  }

  // VoidCallback? _handleButtonPress(BuildContext context) {
  //   return () {
  //     context.read<GenerationBloc>().add(PostRequesttoAPI());
  //   };
  // }

  void _showSuccessMessage(BuildContext context) {
    context.read<GenerationBloc>().add(ClearTextField());
    while (context.canPop()) {
      context.pop();
    }
    context.go('/');
    context.read<GenerationBloc>().add(ResetState());
    Flushbar(
      title: "Mission accomplished!",
      message: "Your script has been successfully generated",
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(8),
      borderRadius: BorderRadius.circular(8),
      backgroundColor: Colors.green,
      icon: Icon(
        Icons.done_rounded,
        color: Colors.white,
      ),
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.FLOATING,
    ).show(context);
  }

  void _showSaveFileDialog(BuildContext context) {
    CustomDialogBox().showAwesomeDialog(
      context,
      NameTheScript(),
      DialogType.question,
      () => _cancelDialog(context),
      () => _confirmDialog(context),
    );
  }

  void _cancelDialog(BuildContext context) {
    // while (context.canPop()) {
    context.pop();

    // context.go('/');
    context.read<GenerationBloc>().add(ClearTextField());
    context.read<GenerationBloc>().add(ResetState());
  }

  void _confirmDialog(BuildContext context) {
    String title =
        context.read<GenerationBloc>().fileName.text.trim(); // Get filename
    if (title.isEmpty) {
      ErrorFlushbar()
          .showErrorFlushbar("Please enter a valid file name", context);
      return;
    }
    context.read<GenerationBloc>().add(PostRequesttoAPI(title: title));
  }
}
