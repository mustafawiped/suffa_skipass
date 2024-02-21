// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class createDefaultButton extends StatelessWidget {
  const createDefaultButton({
    super.key,
    required this.context,
    required this.onClick,
    required this.buttonText,
  });

  final BuildContext context;
  final VoidCallback onClick;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: 10.0,
          bottom: 20.0,
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            surfaceTintColor: Colors.transparent,
            backgroundColor: Colors.grey.shade100,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: onClick,
          child: Text(
            buttonText,
            style: GoogleFonts.outfit(
              color: Colors.grey.shade800,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
