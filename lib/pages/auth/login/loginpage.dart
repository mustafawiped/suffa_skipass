import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:suffa_skipass/core/resources/skipass_assets.dart';
import 'package:suffa_skipass/core/resources/skipass_size.dart';
import 'package:suffa_skipass/pages/auth/forgotpassword/forgotpasspage.dart';
import 'package:suffa_skipass/pages/auth/login/widgets/default_button.dart';
import 'package:suffa_skipass/pages/auth/login/widgets/info_texts.dart';
import 'package:suffa_skipass/pages/home/homepage.dart';
import 'package:suffa_skipass/utils/theme_utils.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const String routeName = "login_page_route_name";
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  /*

    ChangeNotifierProvider<HomePageViewModel>(
              create: (BuildContext context) => viewModel,
              child: Consumer<HomePageViewModel>(
                builder: (context, viewModel, _) {
                  return buildHomeUI();
                },
              ),
            ),

  */
  bool passwordObsState = true;

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
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // sizedbox
                    const SizedBox(height: 30),

                    // info texts
                    infoTexts(
                      context: context,
                      titleText: "Tekrar Hoşgeldin!\nSeni görmek güzel.",
                      subTitleText:
                          "Tekrardan seninle karşılaşmak harika! Eposta ve şifre ile şahsi hesabına giriş yapabilirsin. Mutlu tatiller!",
                    ),

                    // textfield
                    buildInputs(),

                    // you forgot the password
                    buildForgotPassword(),

                    // button
                    createDefaultButton(
                      buttonText: "Giriş Yap".toUpperCase(),
                      context: context,
                      onClick: () => Navigator.pushNamedAndRemoveUntil(
                          context, HomePage.routeName, (route) => false),
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
                        color: SkipassThemeUtils.getSpaciousBgColorReverse(
                            context),
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
      ),
    );
  }

  Padding buildForgotPassword() {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, right: 20.0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, ForgotPasswordPage.routeName);
        },
        child: Row(
          children: [
            Text(
              "Şifreni mi unuttun?",
              style: GoogleFonts.outfit(
                textStyle: TextStyle(
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w600,
                  fontSize: SkipassSizes.textSubtitleSize,
                ),
              ),
            ),
            const SizedBox(width: 5),
            Text(
              "Şimdi Sıfırla.",
              style: GoogleFonts.outfit(
                textStyle: TextStyle(
                  color: SkipassThemeUtils.getSpaciousBgColorReverse(context),
                  fontWeight: FontWeight.w700,
                  fontSize: SkipassSizes.textSubtitleSize,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column buildInputs() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
              left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 5.0, bottom: 3.0, top: 3.0),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                maxLength: 50,
                style: GoogleFonts.outfit(
                  textStyle: TextStyle(
                    color: Colors.grey.shade800,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Eposta",
                  hintStyle: GoogleFonts.outfit(
                      textStyle: TextStyle(
                    color: Colors.grey.shade500,
                    fontWeight: FontWeight.w400,
                  )),
                  prefixIcon: Icon(
                    Icons.mail,
                    color: Colors.grey.shade800,
                  ),
                  counterText: "",
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 20.0, right: 20.0, top: 5.0, bottom: 10.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 5.0, bottom: 3.0, top: 3.0),
              child: TextField(
                obscureText: passwordObsState,
                keyboardType: TextInputType.visiblePassword,
                maxLength: 50,
                style: GoogleFonts.outfit(
                  textStyle: TextStyle(
                    color: Colors.grey.shade800,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Şifre",
                  hintStyle: GoogleFonts.outfit(
                    textStyle: TextStyle(
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.password,
                    color: Colors.grey.shade800,
                  ),
                  counterText: "",
                  suffixIcon: passwordObs(),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  GestureDetector passwordObs() {
    return GestureDetector(
      onTap: () {
        setState(() {
          passwordObsState = !passwordObsState;
        });
      },
      child: Icon(
        passwordObsState ? Icons.visibility : Icons.visibility_off,
        color: Colors.grey.shade800,
      ),
    );
  }
}
