import 'package:flutter/material.dart';

enum ToastType { success, failure, warning }

class SkipassNotification extends StatelessWidget {
  final ToastType toastType;
  final String message;
  const SkipassNotification({
    required this.toastType,
    required this.message,
    super.key,
  });

  String _getTitle() {
    switch (toastType) {
      case ToastType.success:
        return "Başarılı";
      case ToastType.failure:
        return "Hata";
      case ToastType.warning:
        return "Uyarı";
    }
  }

  Color _getCardBackgroundColor() {
    switch (toastType) {
      case ToastType.success:
        return Colors.green.shade100;
      case ToastType.failure:
        return Colors.red.shade100;
      case ToastType.warning:
        return Colors.amber.shade100;
    }
  }

  Color _getBadgeColor() {
    switch (toastType) {
      case ToastType.success:
        return Colors.green.shade700;
      case ToastType.failure:
        return Colors.red.shade700;
      case ToastType.warning:
        return Colors.amber.shade700;
    }
  }

  Color _getTextColor() {
    switch (toastType) {
      case ToastType.success:
        return Colors.green.shade800;
      case ToastType.failure:
        return Colors.red.shade800;
      case ToastType.warning:
        return Colors.amber.shade800;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: _getBadgeColor(),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 4),
        child: Container(
          width: MediaQuery.of(context).size.width * .85,
          constraints: const BoxConstraints(maxWidth: 400, maxHeight: 100),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            color: _getCardBackgroundColor(),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  _getTitle(),
                  style: TextStyle(
                    color: _getTextColor(),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  message,
                  maxLines: 3,
                  style: TextStyle(
                    color: _getTextColor(),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
