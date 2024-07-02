import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

import "../../../../utils/theme_utils.dart";

class PistsBuildMainList extends StatelessWidget {
  const PistsBuildMainList({
    super.key,
    required this.dataList,
  });

  final List<Map<String, dynamic>> dataList;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
      decoration: BoxDecoration(
        color: SkipassThemeUtils.getContentBackgroundColor(context),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: dataList.length,
        itemBuilder: (context, index) {
          Map<String, dynamic> data = dataList[index];
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 10.0, right: 10.0, bottom: 5.0, top: 5.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(
                              data["pistName"],
                              style: GoogleFonts.outfit(
                                textStyle: const TextStyle(
                                  color: Color.fromARGB(255, 237, 239, 253),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Uzunluk",
                                    style: GoogleFonts.outfit(
                                      textStyle: TextStyle(
                                        color: Colors.grey[300],
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    data["pistLength"],
                                    style: GoogleFonts.outfit(
                                      textStyle: TextStyle(
                                        color:
                                            SkipassThemeUtils.getSubtitleColor(
                                                context),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Ezilme T.",
                                    style: GoogleFonts.outfit(
                                      textStyle: TextStyle(
                                        color: Colors.grey[300],
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    data["pistCrushed"],
                                    style: GoogleFonts.outfit(
                                      textStyle: TextStyle(
                                        color:
                                            SkipassThemeUtils.getSubtitleColor(
                                                context),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Pist No",
                                    style: GoogleFonts.outfit(
                                      textStyle: TextStyle(
                                        color: Colors.grey[300],
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    data["pistNo"],
                                    style: GoogleFonts.outfit(
                                      textStyle: TextStyle(
                                        color:
                                            SkipassThemeUtils.getSubtitleColor(
                                                context),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 6),
                        Container(
                          width: 80,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: SkipassThemeUtils.getBgColor(context),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  (data["pistState"] ? "Aktif" : "Kapalı")
                                      .toUpperCase(),
                                  style: GoogleFonts.outfit(
                                    textStyle: TextStyle(
                                        color:
                                            SkipassThemeUtils.getItemTextColor(
                                                context),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 10),
                                  ),
                                ),
                                const SizedBox(width: 3),
                                Icon(
                                  Icons.circle,
                                  size: 9,
                                  color: (data["pistState"]
                                      ? Colors.green
                                      : Colors.red),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          width: 80,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: SkipassThemeUtils.getBgColor(context),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Zorluk".toUpperCase(),
                                  style: GoogleFonts.outfit(
                                    textStyle: TextStyle(
                                        color:
                                            SkipassThemeUtils.getItemTextColor(
                                                context),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 10),
                                  ),
                                ),
                                const SizedBox(width: 3),
                                Icon(
                                  Icons.circle,
                                  size: 9,
                                  color: (data["pistLevel"] == 0
                                      ? Colors.blue
                                      : data["pistLevel"] == 1
                                          ? Colors.orange
                                          : Colors.purple),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              if ((dataList.length - 1) != index)
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Divider(
                    color: SkipassThemeUtils.getContentBackgroundOtherColor(
                        context),
                  ),
                ),
              if ((dataList.length - 1) == index) const SizedBox(height: 5)
            ],
          );
        },
      ),
    );
  }
}
