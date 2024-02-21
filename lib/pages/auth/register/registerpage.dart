import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:suffa_skipass/core/resources/skipass_size.dart';
import 'package:suffa_skipass/pages/auth/login/widgets/default_button.dart';
import 'package:suffa_skipass/pages/auth/login/widgets/info_texts.dart';
import 'package:suffa_skipass/pages/auth/register/widgets/email_widget.dart';
import 'package:suffa_skipass/pages/auth/register/widgets/name_widget.dart';
import 'package:suffa_skipass/pages/auth/register/widgets/password_widget.dart';
import 'package:suffa_skipass/pages/auth/register/widgets/surname_widget.dart';
import 'package:suffa_skipass/pages/home/homepage.dart';
import 'package:suffa_skipass/utils/theme_utils.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  static const String routeName = "register_page_route_name";

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isCheckBoxChecked = false;

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            // info texts
            infoTexts(
              context: context,
              titleText: "Aramıza Hoşgeldin!",
              subTitleText:
                  "Suffa Skipass'ın tüm özelliklerinden yararlanmak için, hesap oluşturman yeterli!",
            ),

            // inputs
            buildInputs(),

            // checkbox
            buildCheckUserPolicy(context),

            // btn
            createDefaultButton(
              buttonText: "Kayıt Ol".toUpperCase(),
              context: context,
              onClick: () => Navigator.pushNamedAndRemoveUntil(
                  context, HomePage.routeName, (route) => false),
            ),
          ],
        ),
      ),
    );
  }

  Padding buildCheckUserPolicy(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Checkbox(
            activeColor: SkipassThemeUtils.getSubtitleColor(context),
            checkColor: SkipassThemeUtils.getContentBackgroundColor(context),
            value: isCheckBoxChecked,
            onChanged: (value) {
              setState(() {
                isCheckBoxChecked = value!;
              });
            },
          ),
          Text(
            "Kullanıcı sözleşmesini kabul ediyorum.",
            style: GoogleFonts.outfit(
              textStyle: TextStyle(
                color: View.of(context).platformDispatcher.platformBrightness ==
                        Brightness.light
                    ? Colors.grey.shade800
                    : Colors.grey.shade200,
                fontWeight: FontWeight.w600,
                fontSize: SkipassSizes.textSubtitleSize,
              ),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox buildRegisterBtn() {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: 10.0,
          bottom: 20.0,
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            surfaceTintColor: Colors.transparent,
            backgroundColor: Colors.grey.shade100,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context, HomePage.routeName, (route) => false);
          },
          child: Text(
            "Kayıt Ol".toUpperCase(),
            style: GoogleFonts.outfit(
              color: Colors.grey.shade800,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Column buildInputs() {
    return const Column(
      children: [
        createNameWidget(),
        createSurnameWidget(),
        createEmailWidget(),
        createPasswordWidget(againState: false),
        createPasswordWidget(againState: true),
      ],
    );
  }
}
