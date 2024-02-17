import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_snowfall/snows/snowfall_widget.dart';
import 'package:suffa_skipass/core/resources/skipass_assets.dart';
import 'package:suffa_skipass/core/resources/skipass_size.dart';
import 'package:suffa_skipass/utils/theme_utils.dart';
import 'package:suffa_skipass/viewmodel/homepage_vm/home_page_view_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String routeName = "home_page_route_name";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Locales.string(context, 'hello')
  final HomePageViewModel viewModel = HomePageViewModel();

  Widget buildUI() {
    return SafeArea(
      child: Column(
        children: [
          // top 2 icon button
          buildTopMenu(),

          // konteynır
          buildMainContent(),

          // sizedbox
          const SizedBox(height: 20),

          // fast access
          buildFastAccessItems(),
        ],
      ),
    );
  }

  Widget buildMainContent() {
    return Container(
        width: double.infinity,
        height: 225,
        margin: const EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(
            color: SkipassThemeUtils.getContentBackgroundColor(context),
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Bugün 13 °C",
                        style: GoogleFonts.outfit(
                          textStyle: TextStyle(
                            color:
                                SkipassThemeUtils.getHeaderTextColor(context),
                            fontSize: SkipassSizes.textHeaderSize,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color:
                                SkipassThemeUtils.getHeaderTextColor(context),
                            size: SkipassSizes.iconSubtitleSize,
                          ),
                          Text(
                            "Telesiyej",
                            style: GoogleFonts.outfit(
                              textStyle: TextStyle(
                                color: SkipassThemeUtils.getHeaderTextColor(
                                    context),
                                fontSize: SkipassSizes.textSubtitleSize,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Text(
                    "2 Şubat, Çarşamba",
                    style: GoogleFonts.outfit(
                      textStyle: TextStyle(
                        color: SkipassThemeUtils.getHeaderTextColor(context),
                        fontSize: SkipassSizes.textSubtitleSize,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox.fromSize(
                      child: Image.asset(SkipassAssets.contentSkiers,
                          fit: BoxFit.cover),
                    ),
                  )),
            ),
            const SnowfallWidget(
              gravity: 0.01,
              windIntensity: 0.1,
              size: Size.square(240),
              numberOfSnowflakes: 10,
            ),
          ],
        ));
  }

  Widget buildTopMenu() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu,
              color: SkipassThemeUtils.getContentPickupColor(context),
            )),
        Image.asset(
          SkipassAssets.appLogo,
          width: 100,
          height: 90,
        ),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.person,
              color: SkipassThemeUtils.getContentPickupColor(context),
            )),
      ],
    );
  }

  Widget buildFastAccessItems() {
    return Column(
      children: [
        buildFibersAndPistes(),
      ],
    );
  }

  Widget buildFibersAndPistes() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Row(
        children: [
          Expanded(
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
          const SizedBox(width: 10),
          Container(
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
                        "Lifler",
                        style: GoogleFonts.outfit(),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<HomePageViewModel>(
        create: (BuildContext context) => viewModel,
        child: Consumer<HomePageViewModel>(
          builder: (context, viewModel, _) {
            return buildUI();
          },
        ),
      ),
    );
  }
}
