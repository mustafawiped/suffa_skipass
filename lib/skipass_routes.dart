import 'package:flutter/material.dart';
import 'package:suffa_skipass/pages/auth/authpage.dart';
import 'package:suffa_skipass/pages/auth/forgotpassword/forgotpasspage.dart';
import 'package:suffa_skipass/pages/auth/login/loginpage.dart';
import 'package:suffa_skipass/pages/auth/register/registerpage.dart';
import 'package:suffa_skipass/pages/home/homepage.dart';

class SkipassRoutes {
  static Map<String, StatefulWidget Function(dynamic)> routes(
      BuildContext context) {
    return {
      // auth page
      AuthPage.routeName: (context) => const AuthPage(),

      // home page
      HomePage.routeName: (context) => const HomePage(),

      // login page
      LoginPage.routeName: (context) => const LoginPage(),

      // register page
      RegisterPage.routeName: (context) => const RegisterPage(),

      // forgot password page
      ForgotPasswordPage.routeName: (context) => const ForgotPasswordPage(),
    };
  }
}
