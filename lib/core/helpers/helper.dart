import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:suffa_skipass/core/helpers/notification.dart';

class Helpers {
  static void showSuccessToast(BuildContext context, String message,
      {Duration duration = const Duration(seconds: 3)}) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BotToast.showCustomNotification(
        toastBuilder: (_) =>
            SkipassNotification(toastType: ToastType.success, message: message),
        duration: duration,
        align: const Alignment(0, 0.8),
      );
    });
  }

  /// Shows a failure toast.
  static void showErrorToast(BuildContext context, String message,
      {Duration duration = const Duration(seconds: 3)}) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BotToast.showCustomNotification(
        toastBuilder: (_) =>
            SkipassNotification(toastType: ToastType.failure, message: message),
        duration: duration,
        align: const Alignment(0, 0.8),
      );
    });
  }

  /// Shows a failure toast.
  static void showWarningToast(BuildContext context, String message,
      {Duration duration = const Duration(seconds: 3)}) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BotToast.showCustomNotification(
        toastBuilder: (_) =>
            SkipassNotification(toastType: ToastType.warning, message: message),
        duration: duration,
        align: const Alignment(0, 0.8),
      );
    });
  }
}
