import 'package:flutter/material.dart';

class SkipassAssets {
  static const String appLogo = "assets/images/companylogo.png";
  static const String appLogoDark = "assets/images/companylogo_dark.png";

  // content
  static const String contentSkiers = "assets/images/contents/skiers.png";
  static const String contentFibers = "assets/images/contents/fibers.jpg";
  static const String contentPistes = "assets/images/contents/pistes.png";
  static const String contentHouse = "assets/images/contents/house.jpeg";
  static const String contentAuth = "assets/images/contents/auth.jpeg";
  static const String contentSkirts = "assets/images/contents/skirts.png";

  // image icon
  static const String imgiconA1 = "assets/images/imageicon/a1.png";
  static const String imgiconA2 = "assets/images/imageicon/a2.png";
  static const String imgiconA3 = "assets/images/imageicon/a3.png";
  static const String imgiconA4 = "assets/images/imageicon/a4.png";

  // icons
  static const String iconHome = "assets/icons/home.riv";
  static const String iconPerson = "assets/icons/person.riv";
  static const String iconSearch = "assets/icons/search.riv";
  static const String iconSettings = "assets/icons/settings.riv";
  static const String iconStar = "assets/icons/star.riv";
  static const String iconUpdate = "assets/icons/update.riv";

  // menu
  static const String iconMenu = "assets/icons/menubutton.riv";

  static dynamic getAppLogo(BuildContext context) =>
      View.of(context).platformDispatcher.platformBrightness == Brightness.light
          ? appLogo
          : appLogoDark;
}
