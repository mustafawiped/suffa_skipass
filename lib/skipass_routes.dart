import 'package:flutter/material.dart';
import 'package:suffa_skipass/pages/homepage.dart';

class SkipassRoutes {
  static Map<String, StatefulWidget Function(dynamic)> routes(
      BuildContext context) {
    return {
      HomePage.routeName: (context) => const HomePage(),
    };
  }
}
