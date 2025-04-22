import 'package:flutter/material.dart';

enum SnackbarType { success, error }

void showCustomSnackbar(
  BuildContext context, {
  required String message,
  SnackbarType type = SnackbarType.error,
  Duration duration = const Duration(seconds: 4),
}) {
  final backgroundColor =
      type == SnackbarType.success ? Colors.green : Colors.red;
  final icon =
      type == SnackbarType.success
          ? Icons.check_circle_outline
          : Icons.error_outline;

  ScaffoldMessenger.of(context).hideCurrentSnackBar();

  final snackBar = SnackBar(
    behavior: SnackBarBehavior.floating,
    backgroundColor: backgroundColor,
    duration: duration,
    content: Row(
      children: [
        Icon(icon, color: Colors.white),
        const SizedBox(width: 12),
        Expanded(
          child: Text(message, style: const TextStyle(color: Colors.white)),
        ),
      ],
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
