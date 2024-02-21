import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: camel_case_types
class createSurnameWidget extends StatelessWidget {
  const createSurnameWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 20.0, right: 20.0, top: 10.0, bottom: 5.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 5.0, bottom: 3.0, top: 3.0),
          child: TextField(
            keyboardType: TextInputType.text,
            maxLength: 50,
            textCapitalization: TextCapitalization.sentences,
            style: GoogleFonts.outfit(
              textStyle: TextStyle(
                color: Colors.grey.shade800,
                fontWeight: FontWeight.w600,
              ),
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Soyisim",
              hintStyle: GoogleFonts.outfit(
                  textStyle: TextStyle(
                color: Colors.grey.shade500,
                fontWeight: FontWeight.w400,
              )),
              prefixIcon: Icon(
                Icons.person,
                color: Colors.grey.shade800,
              ),
              counterText: "",
            ),
          ),
        ),
      ),
    );
  }
}
