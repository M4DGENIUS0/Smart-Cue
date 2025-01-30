import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class ErrorFlushbar {
  void showErrorFlushbar(String message, BuildContext context) {
    Flushbar(
      message: message,
      icon: const Icon(Icons.error_outline, color: Colors.white),
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(8),
      borderRadius: BorderRadius.circular(8),
      backgroundColor: Colors.red.shade600,
      flushbarPosition: FlushbarPosition.TOP,
    ).show(context);
  }
}
