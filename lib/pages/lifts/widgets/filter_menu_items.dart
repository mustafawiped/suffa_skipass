import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:suffa_skipass/core/resources/skipass_color.dart';
import 'package:suffa_skipass/utils/theme_utils.dart';

class LiftsPageFilterMenuItems extends StatelessWidget {
  const LiftsPageFilterMenuItems(
      {super.key,
      required this.onA1Clicked,
      required this.onA2Clicked,
      required this.onA3Clicked,
      required this.onA4Clicked});

  final VoidCallback onA1Clicked;
  final VoidCallback onA2Clicked;
  final VoidCallback onA3Clicked;
  final VoidCallback onA4Clicked;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: SkipassColors.darkColor,
      child: Column(
        children: [
          buildHeaderText("Liftleri Filtrele"),
          // 1. option
          buildOption(context, "A1 Telesiyej", onA1Clicked),

          const SizedBox(height: 2),
          buildOption(context, "A2 Telesiyej", onA2Clicked),

          const SizedBox(height: 2),
          buildOption(context, "A3 Telesiyej", onA3Clicked),

          const SizedBox(height: 2),

          buildOption(context, "A4 Telesiyej", onA4Clicked),
        ],
      ),
    );
  }

  Text buildHeaderText(title) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: GoogleFonts.outfit(
        textStyle: TextStyle(
          color: Colors.grey.shade200,
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
    );
  }

  GestureDetector buildOption(
      BuildContext context, String title, VoidCallback onClick) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        onClick();
      },
      child: Container(
        height: 50,
        color: SkipassThemeUtils.getContentBackgroundColor(context),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 4),
                Text(
                  title,
                  style: GoogleFonts.outfit(
                    textStyle: const TextStyle(
                      color: SkipassColors.lightColor,
                      fontSize: 17,
                    ),
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
