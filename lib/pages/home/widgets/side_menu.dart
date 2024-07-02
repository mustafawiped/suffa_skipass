import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';
import 'package:suffa_skipass/core/resources/skipass_size.dart';
import 'package:suffa_skipass/models/local/home_models/rive_asset_model.dart';
import 'package:suffa_skipass/utils/rive_utils.dart';
import 'package:suffa_skipass/utils/theme_utils.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  RiveAsset selectedMenu = sideMenus.first;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        width: 288,
        backgroundColor: SkipassThemeUtils.getContentBackgroundColor(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // info widget
            const InfoWidget(
                name: "Mustafa Gür", profession: "mustafawiped@gmail.com"),

            Padding(
              padding: const EdgeInsets.only(left: 24, top: 15, bottom: 16),
              child: Text(
                "Gözat",
                style: GoogleFonts.outfit(
                  textStyle: const TextStyle(
                    color: Colors.white70,
                    fontSize: SkipassSizes.textHeaderSize,
                  ),
                ),
              ),
            ),
            //  SideMenuTile
            ...sideMenus.map(
              (menu) => SideMenuContent(
                menu: menu,
                riveonInit: (artboard) {
                  StateMachineController controller =
                      RiveUtils.getRiveController(artboard,
                          stateMachineName: menu.stateMachineName);
                  menu.input = controller.findSMI("active") as SMIBool;
                },
                press: () {
                  menu.input!.change(true);
                  Future.delayed(const Duration(seconds: 1), () {
                    menu.input!.change(false);
                  });
                  setState(() {
                    selectedMenu = menu;
                  });
                },
                isActive: selectedMenu == menu,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, top: 32, bottom: 16),
              child: Text(
                "Seçenekler",
                style: GoogleFonts.outfit(
                  textStyle: const TextStyle(
                    color: Colors.white70,
                    fontSize: SkipassSizes.textHeaderSize,
                  ),
                ),
              ),
            ),
            ...sideMenuOptions.map(
              (menu) => SideMenuContent(
                menu: menu,
                riveonInit: (artboard) {
                  StateMachineController controller =
                      RiveUtils.getRiveController(artboard,
                          stateMachineName: menu.stateMachineName);
                  menu.input = controller.findSMI("active") as SMIBool;
                },
                press: () {
                  menu.input!.change(true);
                  Future.delayed(const Duration(seconds: 1), () {
                    menu.input!.change(false);
                  });
                  setState(() {
                    selectedMenu = menu;
                  });
                },
                isActive: selectedMenu == menu,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SideMenuContent extends StatelessWidget {
  const SideMenuContent({
    super.key,
    required this.menu,
    required this.press,
    required this.riveonInit,
    required this.isActive,
  });

  final RiveAsset menu;
  final VoidCallback press;
  final ValueChanged<Artboard> riveonInit;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 15, right: 15),
          child: Divider(
            color: Colors.white24,
            height: 1,
          ),
        ),
        Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              height: 56,
              left: 0,
              curve: Curves.fastOutSlowIn,
              width: isActive ? 288 : 0,
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFF6792FF),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            ListTile(
              onTap: press,
              leading: SizedBox(
                height: 34,
                width: 34,
                child: RiveAnimation.asset(
                  menu.src,
                  artboard: menu.artboard,
                  onInit: riveonInit,
                ),
              ),
              title: Text(
                menu.title,
                style: GoogleFonts.outfit(color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class InfoWidget extends StatelessWidget {
  const InfoWidget({
    super.key,
    required this.name,
    required this.profession,
  });

  final String name, profession;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Colors.white24,
          child: Icon(
            CupertinoIcons.person,
            color: Colors.white,
          ),
        ),
        title: Text(
          name,
          style: GoogleFonts.outfit(
            textStyle: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        subtitle: Text(
          profession,
          style: GoogleFonts.outfit(
            textStyle: TextStyle(
              color: Colors.grey.shade400,
              fontSize: SkipassSizes.textSubtitleSize,
            ),
          ),
        ),
      ),
    );
  }
}
