import 'package:rive/rive.dart';
import 'package:suffa_skipass/core/resources/skipass_assets.dart';

class RiveAsset {
  final String artboard, stateMachineName, title, src;
  late SMIBool? input;

  RiveAsset(this.src,
      {required this.artboard,
      required this.stateMachineName,
      required this.title,
      this.input});

  set setInput(SMIBool status) {
    input = status;
  }
}

List<RiveAsset> sideMenus = [
  RiveAsset(
    SkipassAssets.iconPerson,
    artboard: "USER",
    stateMachineName: "USER_Interactivity",
    title: "Profilim",
  ),
  RiveAsset(
    SkipassAssets.iconHome,
    artboard: "HOME",
    stateMachineName: "HOME_interactivity",
    title: "Anasayfa",
  ),
  RiveAsset(
    SkipassAssets.iconSearch,
    artboard: "SEARCH",
    stateMachineName: "SEARCH_Interactivity",
    title: "Arama",
  ),
  RiveAsset(
    SkipassAssets.iconStar,
    artboard: "LIKE/STAR",
    stateMachineName: "STAR_Interactivity",
    title: "Keşfet",
  ),
];

List<RiveAsset> sideMenuOptions = [
  RiveAsset(
    SkipassAssets.iconSettings,
    artboard: "SETTINGS",
    stateMachineName: "SETTINGS_Interactivity",
    title: "Ayarlar",
  ),
  RiveAsset(
    SkipassAssets.iconUpdate,
    artboard: "REFRESH/RELOAD",
    stateMachineName: "RELOAD_Interactivity",
    title: "Güncellemeler",
  ),
];
