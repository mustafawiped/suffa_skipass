import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:suffa_skipass/core/resources/skipass_color.dart';

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
      color: SkipassColors.primaryColor,
      child: Column(
        children: [
          Text(
            "Liftleri Filtrele",
            textAlign: TextAlign.center,
            style: GoogleFonts.outfit(
              textStyle: TextStyle(
                color: Colors.grey.shade200,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
          // 1. option
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              onA1Clicked();
            },
            child: Container(
              height: 50,
              color: SkipassColors.surfaceColor,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.star,
                        color: SkipassColors.lightColor,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "A1 Telesiyejler",
                        style: GoogleFonts.outfit(
                            textStyle: const TextStyle(
                                color: SkipassColors.lightColor)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 2),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              onA2Clicked();
            },
            child: Container(
              height: 50,
              color: SkipassColors.surfaceColor,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.star,
                        color: SkipassColors.lightColor,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "A2 Telesiyejler",
                        style: GoogleFonts.outfit(
                            textStyle: const TextStyle(
                                color: SkipassColors.lightColor)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 2),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              onA3Clicked();
            },
            child: Container(
              height: 50,
              color: SkipassColors.surfaceColor,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.star,
                        color: SkipassColors.lightColor,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "A3 Telesiyejler",
                        style: GoogleFonts.outfit(
                            textStyle: const TextStyle(
                                color: SkipassColors.lightColor)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 2),

          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              onA4Clicked();
            },
            child: Container(
              height: 50,
              color: SkipassColors.surfaceColor,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.star,
                        color: SkipassColors.lightColor,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "A4 Telesiyejler",
                        style: GoogleFonts.outfit(
                            textStyle: const TextStyle(
                                color: SkipassColors.lightColor)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
