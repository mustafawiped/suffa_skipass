import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/theme_utils.dart';

class PistsSearchPageInputWidget extends StatelessWidget {
  const PistsSearchPageInputWidget(
      {super.key, required this.onClick, required this.controller});

  final Function(String value) onClick;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 10),
      child: SizedBox(
        width: double.infinity,
        child: TextField(
          controller: controller,
          maxLength: 30,
          autofocus: true,
          textCapitalization: TextCapitalization.sentences,
          style: GoogleFonts.outfit(
            textStyle: TextStyle(
              color: SkipassThemeUtils.getItemTextColor(context),
              fontWeight: FontWeight.w500,
            ),
          ),
          onSubmitted: onClick,
          cursorColor: Colors.grey,
          textInputAction: TextInputAction.search,
          maxLines: 1,
          inputFormatters: [
            FilteringTextInputFormatter.deny(
                RegExp(r'[^\w\s\ı\ü\ö\Ö\Ü\ç\Ç\Ğ\ğ.]')),
          ],
          decoration: InputDecoration(
            hintText: 'Pist Adı..',
            hintStyle: GoogleFonts.outfit(
              textStyle: TextStyle(
                color: SkipassThemeUtils.getSubtitleColor(context),
              ),
            ),
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            filled: true,
            fillColor: SkipassThemeUtils.getContentBackgroundColor(context),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 0.0,
            ),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            counterText: "",
          ),
        ),
      ),
    );
  }
}
