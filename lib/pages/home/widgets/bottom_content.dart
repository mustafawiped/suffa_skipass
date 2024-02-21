import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:suffa_skipass/core/resources/skipass_size.dart';
import 'package:suffa_skipass/utils/theme_utils.dart';

class HomePageBottomContent extends StatelessWidget {
  const HomePageBottomContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Container(
              decoration: BoxDecoration(
                color: SkipassThemeUtils.getContentBackgroundColor(context),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: Column(
                children: [
                  buildListItem(
                    "Konaklama",
                    "Kayak Merkezine yakın konaklama hizmetleri..",
                    Icons.hotel,
                    context,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Divider(
                      color: Colors.grey.shade600,
                    ),
                  ),
                  buildListItem(
                    "Ulaşım",
                    "Kayak Merkezine ulaşım bilgilerini gösterir..",
                    Icons.directions_bus_filled,
                    context,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Divider(
                      color: Colors.grey.shade600,
                    ),
                  ),
                  buildListItem(
                    "Acil Yardım",
                    "Lütfen yalnızca acil durumda yardıma ihtiyacınız varken kullanın.",
                    Icons.error,
                    context,
                  ),
                ],
              )),
        ),
      ],
    );
  }

  Widget buildListItem(
      String title, String subTitle, IconData iconDt, BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: GoogleFonts.outfit(
            fontSize: SkipassSizes.textMiniTitleSize,
            color: SkipassThemeUtils.getHeaderTextColor(context)),
      ),
      subtitle: Text(
        subTitle,
        style: GoogleFonts.outfit(
            textStyle: TextStyle(
                fontSize: SkipassSizes.textMiniSubtitleSize,
                color: SkipassThemeUtils.getSubtitleColor(context))),
      ),
      leading: Icon(
        iconDt,
        color: SkipassThemeUtils.getHeaderTextColor(context),
      ),
      trailing: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_circle_right_sharp,
              color: SkipassThemeUtils.getSubtitleColor(context))),
    );
  }
}
