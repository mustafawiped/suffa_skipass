import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/resources/skipass_color.dart';
import '../../../../utils/theme_utils.dart';

class PistsHardshipLevelInfos extends StatelessWidget {
  const PistsHardshipLevelInfos({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: SkipassThemeUtils.getContentBackgroundColor(context),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Text(
            "Zorluk Türleri:",
            style: GoogleFonts.outfit(
              textStyle: TextStyle(
                color: SkipassColors.realisticLightColor,
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      "Kolay",
                      style: GoogleFonts.outfit(
                        textStyle: TextStyle(
                          color: SkipassColors.realisticLightColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Icon(
                      Icons.circle,
                      color: Colors.blue,
                      size: 11,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Orta",
                      style: GoogleFonts.outfit(
                        textStyle: TextStyle(
                          color: SkipassColors.realisticLightColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Icon(
                      Icons.circle,
                      color: Colors.orange,
                      size: 11,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Zor",
                      style: GoogleFonts.outfit(
                        textStyle: TextStyle(
                          color: SkipassColors.realisticLightColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Icon(
                      Icons.circle,
                      color: Colors.purple,
                      size: 11,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
