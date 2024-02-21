import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:suffa_skipass/core/resources/skipass_assets.dart';

class HomePageFastAccessItems extends StatelessWidget {
  const HomePageFastAccessItems(
      {super.key, required this.liftsOnClick, required this.pistsOnClick});

  final VoidCallback liftsOnClick;
  final VoidCallback pistsOnClick;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildLiftsAndPistes(),
      ],
    );
  }

  Widget buildLiftsAndPistes() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: pistsOnClick,
              child: Container(
                height: 225,
                decoration: BoxDecoration(
                  color: Colors.grey.shade600,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Stack(
                  children: [
                    SizedBox(
                      height: 225,
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: SizedBox.fromSize(
                          child: Image.asset(SkipassAssets.contentPistes,
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        width: 100,
                        height: 30,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              topRight: Radius.circular(20)),
                        ),
                        child: Center(
                          child: Text(
                            "Pistler",
                            style: GoogleFonts.outfit(),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          InkWell(
            onTap: liftsOnClick,
            child: Container(
              width: 150,
              height: 225,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                children: [
                  SizedBox(
                    width: 150,
                    height: 225,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: SizedBox.fromSize(
                        child: Image.asset(SkipassAssets.contentFibers,
                            fit: BoxFit.fill),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 100,
                      height: 30,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            topRight: Radius.circular(10)),
                      ),
                      child: Center(
                        child: Text(
                          "Liftler",
                          style: GoogleFonts.outfit(),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
