import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:suffa_skipass/core/resources/skipass_assets.dart';
import 'package:suffa_skipass/core/resources/skipass_size.dart';
import 'package:suffa_skipass/pages/auth/login/widgets/default_button.dart';
import 'package:suffa_skipass/pages/auth/login/widgets/info_texts.dart';
import 'package:suffa_skipass/pages/auth/register/widgets/email_widget.dart';
import 'package:suffa_skipass/utils/theme_utils.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  static const String routeName = "forgot_password_page_route_name";
  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  int step = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SkipassThemeUtils.getSpaciousBgColor(context),
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_sharp,
            color: SkipassThemeUtils.getSpaciousBgColorReverse(context),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  infoTexts(
                    context: context,
                    titleText: "Şifreni Sıfırla!",
                    subTitleText:
                        "Lütfen kayıtlı eposta adresinizi girin, ardından gönderilen doğrulama kodunu girerek şifrenizi sıfırlayın.",
                  ),
                  const createEmailWidget(),
                  createDefaultButton(
                    context: context,
                    onClick: () {},
                    buttonText: "Devam".toUpperCase(),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Suffa Skipass © 2024",
                  style: GoogleFonts.outfit(
                    textStyle: TextStyle(
                      color:
                          SkipassThemeUtils.getSpaciousBgColorReverse(context),
                      fontWeight: FontWeight.w600,
                      fontSize: SkipassSizes.textMiniSubtitleSize,
                    ),
                  ),
                ),
              ),
              Image.asset(
                SkipassAssets.getAppLogo(context),
                width: 25,
                height: 25,
              ),
            ],
          )
        ],
      ),
    );
  }
}
