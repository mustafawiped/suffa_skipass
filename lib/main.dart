import "package:flutter/material.dart";
import "package:flutter_locales/flutter_locales.dart";
import "package:suffa_skipass/suffatech_skipass_app.dart";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Locales.init(['en', 'ru', 'tr']);
  runApp(const SuffaSkipass());
}
