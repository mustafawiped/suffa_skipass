import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:suffa_skipass/pages/homepage.dart';
import 'package:suffa_skipass/skipass_routes.dart';
import 'package:suffa_skipass/utils/theme_utils.dart';

class SuffaSkipass extends StatefulWidget {
  const SuffaSkipass({super.key});

  @override
  State<SuffaSkipass> createState() => _SuffaSkipassState();
}

class _SuffaSkipassState extends State<SuffaSkipass> {
  @override
  Widget build(BuildContext context) {
    return LocaleBuilder(builder: (locale) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: SkipassThemeUtils.lightTheme,
        darkTheme: SkipassThemeUtils.darkTheme,
        themeMode: ThemeMode.system,
        builder: BotToastInit(),
        navigatorObservers: [BotToastNavigatorObserver()],
        routes: SkipassRoutes.routes(context),
        localizationsDelegates: Locales.delegates,
        supportedLocales: Locales.supportedLocales,
        locale: locale,
        home: const HomePage(),
      );
    });
  }
}
