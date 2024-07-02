// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

import '../resources/skipass_color.dart';

class loadingDilaog {
  static void show(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
          child: Container(
            width: 150.0,
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.7),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(color: SkipassColors.primaryColor),
                SizedBox(height: 10.0),
              ],
            ),
          ),
        );
      },
    );
  }
}
