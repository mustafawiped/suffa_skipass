import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_snowfall/snows/snowfall_widget.dart';
import 'package:suffa_skipass/core/resources/skipass_assets.dart';
import 'package:suffa_skipass/core/resources/skipass_size.dart';
import 'package:suffa_skipass/utils/theme_utils.dart';

class HomePageMainContent extends StatelessWidget {
  const HomePageMainContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 225,
        margin: const EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(
            color: SkipassThemeUtils.getContentBackgroundColor(context),
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Bugün 13 °C",
                        style: GoogleFonts.outfit(
                          textStyle: TextStyle(
                            color:
                                SkipassThemeUtils.getHeaderTextColor(context),
                            fontSize: SkipassSizes.textHeaderSize,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color:
                                SkipassThemeUtils.getHeaderTextColor(context),
                            size: SkipassSizes.iconSubtitleSize,
                          ),
                          Text(
                            "Telesiyej",
                            style: GoogleFonts.outfit(
                              textStyle: TextStyle(
                                color: SkipassThemeUtils.getHeaderTextColor(
                                    context),
                                fontSize: SkipassSizes.textSubtitleSize,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Text(
                    "2 Şubat, Çarşamba",
                    style: GoogleFonts.outfit(
                      textStyle: TextStyle(
                        color: SkipassThemeUtils.getHeaderTextColor(context),
                        fontSize: SkipassSizes.textSubtitleSize,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox.fromSize(
                      child: Image.asset(SkipassAssets.contentSkiers,
                          fit: BoxFit.cover),
                    ),
                  )),
            ),
            const SnowfallWidget(
              gravity: 0.01,
              windIntensity: 0.1,
              size: Size.square(240),
              numberOfSnowflakes: 10,
            ),
          ],
        ));
  }
}
