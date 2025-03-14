import 'package:flutter/material.dart';

void showCustomSnackBar(
    BuildContext context, {
      required String message,
      SnackBarType type = SnackBarType.info,
      Duration duration = const Duration(seconds: 3),
    }) {
  final overlay = Overlay.of(context);
  final overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      top: MediaQuery.of(context).viewPadding.top + 10, // Place at the top
      left: 20,
      right: 20,
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: _getSnackBarColor(type),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 8,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(_getSnackBarIcon(type), color: Colors.white),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  message,
                  style: const TextStyle(color: Colors.white),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );

  overlay.insert(overlayEntry);

  Future.delayed(duration, () => overlayEntry.remove());
}

enum SnackBarType { success, error, warning, info }

Color _getSnackBarColor(SnackBarType type) {
  switch (type) {
    case SnackBarType.success:
      return Colors.green;
    case SnackBarType.error:
      return Colors.red;
    case SnackBarType.warning:
      return Colors.orange;
    case SnackBarType.info:
    default:
      return Colors.blue;
  }
}

IconData _getSnackBarIcon(SnackBarType type) {
  switch (type) {
    case SnackBarType.success:
      return Icons.check_circle;
    case SnackBarType.error:
      return Icons.error;
    case SnackBarType.warning:
      return Icons.warning;
    case SnackBarType.info:
    default:
      return Icons.info;
  }
}