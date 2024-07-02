import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:suffa_skipass/core/shared/widgets/skipass_button.dart';

import '../../../core/resources/skipass_color.dart';

class QrView {
  static void show(BuildContext context, String qrData) {
    Future.delayed(Duration.zero, () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Center(
            child: Column(
              children: [
                Container(
                  width: 250.0,
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    children: [
                      QrImageView(
                        data: qrData,
                        version: QrVersions.auto,
                        size: 140,
                        gapless: false,
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 30,
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            "Hizmet QR",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.outfit(
                              textStyle: const TextStyle(
                                color: SkipassColors.primaryColor,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),

                      // sizedbox
                      const SizedBox(height: 10),

                      const Padding(
                        padding: EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Divider(
                          color: SkipassColors.primaryColor,
                        ),
                      ),

                      // sizedbox
                      const SizedBox(height: 10),

                      Text(
                        "\u2022 Yukarıdaki QR Kodunu, Kiosk cihazlarımızın QR okuyucularına tutunuz.",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.outfit(
                          textStyle: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withOpacity(0.7),
                          ),
                        ),
                      ),

                      // sizedbox
                      const SizedBox(height: 10),

                      SkipassButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        text: "Kapat",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    });
  }

  static Widget buildInfoText(BuildContext context) => RichText(
        text: const TextSpan(
          children: <TextSpan>[
            TextSpan(
              text:
                  "\u2022 Yukarıdaki QR Kodunu, Kiosk cihazlarımızın QR okuyucularına tutunuz.",
            ),
          ],
        ),
      );
}
