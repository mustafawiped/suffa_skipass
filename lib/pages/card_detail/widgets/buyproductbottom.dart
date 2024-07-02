import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart'
    as picker;
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:suffa_skipass/core/resources/skipass_color.dart';
import 'package:suffa_skipass/core/shared/widgets/skipass_text_input.dart';

import '../../../core/shared/widgets/skipass_button.dart';
import '../../../core/shared/widgets/skipass_custom_month_picker.dart';

class BuyProductBottom extends StatefulWidget {
  const BuyProductBottom({super.key, required this.onClick});

  final Function(
          String cardNumber, String cardHolder, String cardExd, String cardCvv)
      onClick;

  @override
  State<BuyProductBottom> createState() => _BuyProductBottomState();
}

class _BuyProductBottomState extends State<BuyProductBottom> {
  final _cardNumberTextEditingController = TextEditingController();
  final _cardHolderTextEditingController = TextEditingController();
  final _cardExpiryDateTextEditingController = TextEditingController();
  final _cardCVVTextEditingController = TextEditingController();

  final _cardHolderFocusNode = FocusNode();
  final _cardExpiryDateFocusNode = FocusNode();
  final _cardCVVFocusNode = FocusNode();

  bool upstate = false;

  final _cardNumberMaskFormatter = MaskTextInputFormatter(
    mask: '####-####-####-####',
    filter: {'#': RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  final _cardExpiryDateMaskFormatter = MaskTextInputFormatter(
    mask: '##/##',
    filter: {'#': RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  final _cardCVVMaskFormatter = MaskTextInputFormatter(
    mask: '###',
    filter: {'#': RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  Widget _buildCardNumberInput() => SkipassTextInput(
        hint: 'Kart Numarası',
        controller: _cardNumberTextEditingController,
        onFieldSubmitted: (value) => _cardHolderFocusNode.requestFocus(),
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.number,
        inputFormatters: [_cardNumberMaskFormatter],
        prefixIcon: const Icon(Icons.credit_card),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Kart Numarası boş geçilemez.";
          } else if (value.length != 19) {
            return "Kart Numarası 16 haneden küçük olamaz";
          }
          return null;
        },
      );

  Widget _buildCardHolderInput() => SkipassTextInput(
        hint: 'Kart Üzerindeki İsim',
        controller: _cardHolderTextEditingController,
        onFieldSubmitted: (value) => _cardExpiryDateFocusNode.requestFocus(),
        textInputAction: TextInputAction.next,
        onChangedMethod: (p0) {
          _cardHolderTextEditingController.text = p0!.toUpperCase();
        },
        textCapitalization: TextCapitalization.characters,
        focusNode: _cardHolderFocusNode,
        prefixIcon: const Icon(Icons.person),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Alan boş geçilemez.";
          } else if (value.length < 2 || value.split(' ').length < 2) {
            return "Lütfen geçerli bir İsim giriniz.";
          }
          return null;
        },
      );

  Widget _buildCardExpiryDateInput() => SkipassTextInput(
        hint: 'Son Kullanma Tarihi',
        controller: _cardExpiryDateTextEditingController,
        onFieldSubmitted: (value) => _cardCVVFocusNode.requestFocus(),
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.number,
        readOnly: true,
        onTap: () {
          picker.DatePicker.showPicker(
            context,
            locale: picker.LocaleType.tr,
            pickerModel: CustomMonthPicker(
              minTime: DateTime.now(),
              maxTime: DateTime(2035),
              currentTime: DateTime.now(),
              locale: picker.LocaleType.tr,
            ),
            theme: picker.DatePickerTheme(
              backgroundColor: Theme.of(context).colorScheme.background,
              cancelStyle: TextStyle(
                color: Theme.of(context).textTheme.bodyLarge?.color ??
                    Colors.black,
              ),
              doneStyle: const TextStyle(color: SkipassColors.primaryColor),
              itemStyle: TextStyle(
                color: Colors.grey.shade400,
              ),
            ),
            onConfirm: (time) {
              DateTime dateTime = DateTime.parse(time.toString());

              String formattedDate =
                  "${dateTime.month.toString().padLeft(2, '0')}/${dateTime.year.toString().substring(2)}";
              setState(() {
                _cardExpiryDateTextEditingController.text = formattedDate;
              });
            },
          );
        },
        inputFormatters: [_cardExpiryDateMaskFormatter],
        focusNode: _cardExpiryDateFocusNode,
        prefixIcon: const Icon(Icons.event),
      );

  Widget _buildCVVInput() => SkipassTextInput(
        hint: 'Güvenlik Kodu (CVV)',
        controller: _cardCVVTextEditingController,
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.done,
        inputFormatters: [_cardCVVMaskFormatter],
        focusNode: _cardCVVFocusNode,
        prefixIcon: const Icon(Icons.lock),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Alan boş geçilemez.";
          } else if (value.length != 3) {
            return "Lütfen geçerli bir cvv değeri giriniz.";
          }
          return null;
        },
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: upstate ? 800 : 470,
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Column(
        children: [
          // sizedbox
          const SizedBox(height: 20),

          // headertext
          Container(
            height: 30,
            width: double.infinity,
            child: Stack(
              children: [
                Center(
                  child: Text(
                    "Kart Bilgileri",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.outfit(
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(right: 10),
                  alignment: Alignment.topRight,
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          upstate = !upstate;
                        });
                      },
                      icon: Icon(
                          upstate ? Icons.arrow_downward : Icons.arrow_upward)),
                )
              ],
            ),
          ),

          // sizedbox
          const SizedBox(height: 10),

          const Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20.0),
            child: Divider(
              color: Colors.white,
            ),
          ),

          // sizedbox
          const SizedBox(height: 10),

          // inputs
          buildCardInputs(),

          // sizedbox
          const SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: SkipassButton(
              onPressed: () {
                widget.onClick(
                    _cardNumberTextEditingController.text,
                    _cardHolderTextEditingController.text,
                    _cardExpiryDateTextEditingController.text,
                    _cardCVVTextEditingController.text);
              },
              text: "Satın Al",
              iconDT: Icons.payments_sharp,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildInfoText() => RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text:
                  "\u2022 Kart bilgileriniz hiç bir şekilde Suffa Skipass tarafından kaydedilmemektedir.",
              style: GoogleFonts.outfit(
                textStyle: TextStyle(
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                ),
              ),
            ),
          ],
        ),
      );

  Widget buildCardInputs() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildCardNumberInput(),
          const SizedBox(height: 8),
          _buildCardHolderInput(),
          const SizedBox(height: 8),
          _buildCardExpiryDateInput(),
          const SizedBox(height: 8),
          _buildCVVInput(),
          const SizedBox(height: 15),
          _buildInfoText(),
        ],
      ),
    );
  }
}
