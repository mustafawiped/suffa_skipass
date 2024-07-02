import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:suffa_skipass/core/resources/skipass_assets.dart';
import 'package:suffa_skipass/models/local/home_models/virtual_card_model.dart';
import 'package:suffa_skipass/pages/home/widgets/indicator.dart';
import 'package:suffa_skipass/utils/theme_utils.dart';

class HomePageMainContent extends StatelessWidget {
  const HomePageMainContent(
      {super.key,
      required this.dataList,
      required this.selectedIndex,
      required this.onPageChanged,
      required this.goToCardDetail});

  final List<VirtualCardModel> dataList;
  final int selectedIndex;
  final Function(int value) onPageChanged;
  final Function(VirtualCardModel cardData) goToCardDetail;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 225,
      margin: const EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
          color: SkipassThemeUtils.getContentBackgroundColor(context),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: dataList.isNotEmpty
          ? buildMyCards()
          : Center(
              child: Text(
                "Kart eklemek ister misin?",
                style: GoogleFonts.outfit(
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
    );
  }

  Widget buildMyCards() {
    return Column(
      children: [
        SizedBox(
          height: 210,
          child: Center(
            child: PageView.builder(
              itemCount: dataList.length,
              onPageChanged: onPageChanged,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => goToCardDetail(dataList[index]),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    margin: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: Stack(
                      children: [
                        // background image
                        GetCardBackgroundImage(),

                        // card name
                        Container(
                          alignment: Alignment.bottomLeft,
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Container(
                            padding: const EdgeInsets.only(left: 10, right: 5),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Text(
                              dataList[index].cardName,
                              style: GoogleFonts.outfit(
                                textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),

                        // card id
                        Container(
                          alignment: Alignment.bottomRight,
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Container(
                            padding: const EdgeInsets.only(left: 10, right: 5),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  offset: const Offset(0, 1),
                                ),
                              ],
                            ),
                            child: Text(
                              dataList[index].cardId,
                              style: GoogleFonts.outfit(
                                textStyle: const TextStyle(
                                  fontSize: 9,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),

                        // suffatech logo
                        Container(
                          alignment: Alignment.topRight,
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Container(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 5),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white.withOpacity(0.2),
                                    spreadRadius: 1,
                                    blurRadius: 10,
                                    offset: const Offset(0, 5),
                                  ),
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: SizedBox.fromSize(
                                  size: const Size.fromRadius(18),
                                  child: Image.asset(SkipassAssets.appLogo),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
              dataList.length,
              (index) => Indicator(
                isActive: selectedIndex == index,
              ),
            )
          ],
        ),
      ],
    );
  }

  SizedBox GetCardBackgroundImage() {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10), // Image border
        child: SizedBox.fromSize(
          child: Image.asset(
            "assets/images/contents/cardbg.jpg",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
