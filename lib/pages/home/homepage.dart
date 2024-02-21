import 'package:flutter/material.dart';
import 'package:suffa_skipass/core/resources/skipass_assets.dart';
import 'package:suffa_skipass/pages/home/widgets/bottom_content.dart';
import 'package:suffa_skipass/pages/home/widgets/fast_access_items.dart';
import 'package:suffa_skipass/pages/home/widgets/main_content.dart';
import 'package:suffa_skipass/pages/home/widgets/side_menu.dart';
import 'package:suffa_skipass/pages/lifts/liftspage.dart';
import 'package:suffa_skipass/pages/pists/pistpage.dart';
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
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  final PageController pageController = PageController(initialPage: 0);

  bool homeState = false;

  void changePage(int pageIndex) {
    if (pageIndex != 0 && !homeState) {
      setState(() {
        homeState = true;
      });
    } else if (pageIndex == 0 && homeState) {
      setState(() {
        homeState = false;
      });
    }
    pageController.animateToPage(
      pageIndex,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutCubicEmphasized,
    );
  }

  void pistsOnClick() {}

  Widget buildHomeUI() {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 10),

          // main content
          const HomePageMainContent(),

          // sizedbox
          const SizedBox(height: 20),

          // fast access
          HomePageFastAccessItems(
            liftsOnClick: () => changePage(1),
            pistsOnClick: () => changePage(2),
          ),

          // sizedbox
          const SizedBox(height: 20),

          // bottom content
          const HomePageBottomContent(),

          // sizedbox
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        leading: !homeState
            ? IconButton(
                onPressed: () => _globalKey.currentState!.openDrawer(),
                icon: const Icon(Icons.menu),
              )
            : IconButton(
                onPressed: () => changePage(0),
                icon: const Icon(
                  Icons.arrow_back_rounded,
                ),
              ),
        title: Image.asset(
          SkipassAssets.getAppLogo(context),
          width: 100,
          height: 90,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person),
          ),
        ],
      ),
      body: SafeArea(
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: [
            // home page  [0]
            buildHomeUI(),

            // lifts page [1]
            const LiftsPage(),

            // pists page [2],
            const PistPage(),
          ],
        ),
      ),
      drawer: const SideMenu(),
    );
  }
}
