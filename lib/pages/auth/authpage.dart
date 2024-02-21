import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:suffa_skipass/core/resources/skipass_assets.dart';
import 'package:suffa_skipass/core/resources/skipass_size.dart';
import 'package:suffa_skipass/pages/auth/login/loginpage.dart';
import 'package:suffa_skipass/pages/auth/login/widgets/info_texts.dart';
import 'package:suffa_skipass/pages/auth/register/registerpage.dart';
import 'package:suffa_skipass/pages/home/homepage.dart';
import 'package:suffa_skipass/utils/theme_utils.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  static const String routeName = "auth_page_route_name";

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: SkipassThemeUtils.getSpaciousBgColor(context),
        body: SafeArea(
            child: Column(
          children: [
            buildImage(),
            infoTexts(
                context: context,
                titleText: "Hayalinizdeki Tatili\nBurada Keşfedin!",
                subTitleText:
                    "Suffa Skipass ile kayak merkezindeki tüm eğlenceli aktiviteleri, kafeleri, restoranları ve konaklama yerlerini görebilirsiniz!"),
            const SizedBox(height: 30),
            buildSignInWithoutLogging(),
            buildSignInOrSignUp(),
          ],
        )));
  }

  Padding buildSignInWithoutLogging() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, HomePage.routeName, (route) => false);
            },
            child: Text(
              "giriş yapmadan devam et..",
              textAlign: TextAlign.center,
              maxLines: 2,
              style: GoogleFonts.outfit(
                textStyle: TextStyle(
                  color:
                      View.of(context).platformDispatcher.platformBrightness ==
                              Brightness.light
                          ? Colors.grey.shade800
                          : Colors.grey.shade200,
                  fontWeight: FontWeight.w600,
                  fontSize: SkipassSizes.textMiniTitleSize,
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                child: Divider(
                  color: Colors.grey.shade400,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'VEYA',
                  style: GoogleFonts.outfit(
                      textStyle: TextStyle(color: Colors.grey.shade500)),
                ),
              ),
              Expanded(
                child: Divider(
                  color: Colors.grey.shade400,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }

  Padding buildSignInOrSignUp() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: LocalElevatedButton(
                number: 0,
                onPressed: () {
                  Navigator.pushNamed(context, RegisterPage.routeName);
                },
                colors: [
                  View.of(context).platformDispatcher.platformBrightness ==
                          Brightness.light
                      ? Colors.grey.shade300
                      : Colors.transparent,
                  View.of(context).platformDispatcher.platformBrightness ==
                          Brightness.light
                      ? Colors.grey.shade200
                      : Colors.grey.shade100,
                ],
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "Kayıt Ol!",
                    style: GoogleFonts.outfit(
                      textStyle: TextStyle(
                        color: View.of(context)
                                    .platformDispatcher
                                    .platformBrightness ==
                                Brightness.light
                            ? Colors.grey.shade800
                            : Colors.grey.shade300,
                        fontWeight: FontWeight.w600,
                        fontSize: SkipassSizes.textHeaderSize,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: LocalElevatedButton(
                number: 1,
                onPressed: () {
                  Navigator.pushNamed(context, LoginPage.routeName);
                },
                colors: [Colors.grey.shade100, Colors.grey.shade100],
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "Giriş Yap!",
                    style: GoogleFonts.outfit(
                      textStyle: TextStyle(
                        color: Colors.grey.shade800,
                        fontWeight: FontWeight.w600,
                        fontSize: SkipassSizes.textHeaderSize,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding buildImage() {
    return Padding(
      padding: const EdgeInsets.only(
          left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
      child: Container(
        width: double.infinity,
        height: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: SizedBox.fromSize(
            size: const Size.fromRadius(48),
            child: Image.asset(
              SkipassAssets.contentAuth,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

class LocalElevatedButton extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final VoidCallback? onPressed;
  final Widget child;
  final int number;
  final dynamic colors;

  const LocalElevatedButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.borderRadius,
    this.width,
    this.colors,
    required this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          elevation: 0,
          shadowColor: Colors.transparent,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
        ),
        child: child,
      ),
    );
  }
}
