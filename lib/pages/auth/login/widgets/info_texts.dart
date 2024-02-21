// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/resources/skipass_size.dart';

class infoTexts extends StatelessWidget {
  const infoTexts({
    super.key,
    required this.context,
    required this.titleText,
    required this.subTitleText,
  });

  final String titleText;
  final String subTitleText;
  final BuildContext context;

  // "Tekrar Hoşgeldin!\nSeni görmek güzel."
  // "Tekrardan seninle karşılaşmak harika! Eposta ve şifre ile şahsi hesabına giriş yapabilirsin. Mutlu tatiller!"

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(
          children: [
            Text(
              titleText,
              textAlign: TextAlign.center,
              style: GoogleFonts.outfit(
                textStyle: TextStyle(
                  color:
                      View.of(context).platformDispatcher.platformBrightness ==
                              Brightness.light
                          ? Colors.grey.shade800
                          : Colors.grey.shade200,
                  fontWeight: FontWeight.w600,
                  fontSize: SkipassSizes.textBigHeaderSize,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              subTitleText,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: GoogleFonts.outfit(
                textStyle: TextStyle(
                  color:
                      View.of(context).platformDispatcher.platformBrightness ==
                              Brightness.light
                          ? Colors.grey.shade600
                          : Colors.grey.shade400,
                  fontWeight: FontWeight.w600,
                  fontSize: SkipassSizes.textMiniSubtitleSize,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
