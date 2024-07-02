import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:suffa_skipass/core/resources/skipass_assets.dart';
import 'package:suffa_skipass/utils/theme_utils.dart';

class PistsTopInfoWidget extends StatelessWidget {
  const PistsTopInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
      child: Container(
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
          color: SkipassThemeUtils.getItemTextColor(context),
          borderRadius: const BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox.fromSize(
                      child: Image.asset(
                        SkipassAssets.contentSkirts,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 200,
                      ),
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Aktif Pist: 10",
                        style: GoogleFonts.outfit(
                          textStyle: TextStyle(
                            color: Colors.grey[800],
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      const SizedBox(width: 3),
                      const Icon(
                        Icons.circle,
                        color: Colors.green,
                        size: 11,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Kapalı Pist: 3",
                        style: GoogleFonts.outfit(
                          textStyle: TextStyle(
                            color: Colors.grey[800],
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      const SizedBox(width: 3),
                      const Icon(
                        Icons.circle,
                        color: Colors.red,
                        size: 11,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
