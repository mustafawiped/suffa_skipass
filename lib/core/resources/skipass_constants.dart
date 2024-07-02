import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SkipassConstants {
  static const String meterSquare = '\u00b2';

  static MaskTextInputFormatter phoneNumberFormatter = MaskTextInputFormatter(
    mask: "(###) ### ## ##",
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );
}
