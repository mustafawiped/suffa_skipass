import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class createPasswordWidget extends StatefulWidget {
  const createPasswordWidget({super.key, required this.againState});

  final bool againState;

  @override
  State<createPasswordWidget> createState() => _createPasswordWidgetState();
}

class _createPasswordWidgetState extends State<createPasswordWidget> {
  bool passwordObsState = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 20.0, right: 20.0, top: 5.0, bottom: 10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 5.0, bottom: 3.0, top: 3.0),
          child: TextField(
            obscureText: passwordObsState,
            keyboardType: TextInputType.visiblePassword,
            maxLength: 50,
            style: GoogleFonts.outfit(
              textStyle: TextStyle(
                color: Colors.grey.shade800,
                fontWeight: FontWeight.w600,
              ),
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: widget.againState ? "Şifre Tekrarı" : "Şifre",
              hintStyle: GoogleFonts.outfit(
                textStyle: TextStyle(
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.w400,
                ),
              ),
              prefixIcon: Icon(
                Icons.password,
                color: Colors.grey.shade800,
              ),
              counterText: "",
              suffixIcon: passwordObs(),
            ),
          ),
        ),
      ),
    );
  }

  GestureDetector passwordObs() {
    return GestureDetector(
      onTap: () {
        setState(() {
          passwordObsState = !passwordObsState;
        });
      },
      child: Icon(
        passwordObsState ? Icons.visibility : Icons.visibility_off,
        color: Colors.grey.shade800,
      ),
    );
  }
}
