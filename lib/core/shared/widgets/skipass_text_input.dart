import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:suffa_skipass/core/resources/skipass_size.dart';

class SkipassTextInput extends StatefulWidget {
  final EdgeInsets? padding;
  final String hint;
  final String text;
  final bool isObsecure;
  final TextInputType keyboardType;
  final TextCapitalization textCapitalization;
  final String? autoFillHints;
  final TextEditingController? controller;
  final InputDecoration? inputDecoration;
  final TextAlign? textAlign;
  final Function? onEditingComplete;
  final TextInputAction textInputAction;
  final Function(String?)? onFieldSubmitted;
  final Function(String?)? onChangedMethod;
  final FocusNode? focusNode;
  final bool autofocus;
  final int? maxLength;
  final int maxLines;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final bool? enabled;
  final void Function()? onTap;
  final bool readOnly;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;

  const SkipassTextInput({
    this.padding = EdgeInsets.zero,
    required this.hint,
    this.text = '',
    this.isObsecure = false,
    this.keyboardType = TextInputType.text,
    this.textCapitalization = TextCapitalization.none,
    this.autoFillHints,
    this.controller,
    this.inputDecoration,
    this.textAlign,
    this.onEditingComplete,
    this.textInputAction = TextInputAction.unspecified,
    this.onFieldSubmitted,
    this.focusNode,
    this.autofocus = false,
    this.maxLength,
    this.maxLines = 1,
    this.validator,
    this.onSaved,
    this.enabled,
    this.onTap,
    this.readOnly = false,
    this.prefixIcon,
    this.suffixIcon,
    this.inputFormatters,
    super.key,
    this.onChangedMethod,
  });

  @override
  State<SkipassTextInput> createState() => _SkipassTextInputState();
}

class _SkipassTextInputState extends State<SkipassTextInput> {
  Widget _defaultTextInput(BuildContext context) => Container(
        padding: widget.padding,
        child: TextFormField(
          obscureText: widget.isObsecure,
          textAlign: widget.textAlign ?? TextAlign.start,
          onChanged: widget.onChangedMethod,
          decoration: widget.inputDecoration ??
              InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey.shade700),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey.shade700),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey.shade700),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                        BorderSide(color: Theme.of(context).colorScheme.error),
                  ),
                  prefixIcon: widget.prefixIcon,
                  suffixIcon: widget.suffixIcon,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  hintText: widget.hint,
                  hintStyle: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: SkipassSizes.textMiniTitleSize,
                    color: Colors.grey,
                  ),
                  counterText: ""),
          controller: widget.controller,
          inputFormatters: widget.inputFormatters,
          textInputAction: widget.textInputAction,
          textCapitalization: widget.textCapitalization,
          validator: widget.validator,
          onFieldSubmitted: widget.onFieldSubmitted,
          readOnly: widget.readOnly,
          onSaved: widget.onSaved,
          onTap: widget.onTap,
          enabled: widget.enabled,
          focusNode: widget.focusNode,
          autofocus: widget.autofocus,
          maxLength: widget.maxLength,
          maxLines: widget.maxLines,
          autofillHints:
              widget.autoFillHints == null ? [] : [widget.autoFillHints!],
          autocorrect: false,
          style: GoogleFonts.outfit(
            textStyle: TextStyle(
              fontSize: SkipassSizes.textMiniTitleSize,
              color: widget.readOnly ? Colors.grey : Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          keyboardType: widget.keyboardType,
          onEditingComplete: () {
            if (widget.onEditingComplete != null) widget.onEditingComplete!();
          },
        ),
      );

  Widget _obsecureTextInput(BuildContext context) => Container(
        padding: widget.padding,
        child: TextFormField(
          obscureText: widget.isObsecure,
          textAlign: widget.textAlign ?? TextAlign.start,
          decoration: widget.inputDecoration ??
              InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey.shade700),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey.shade700),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey.shade700),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide:
                      BorderSide(color: Theme.of(context).colorScheme.error),
                ),
                prefixIcon: widget.prefixIcon,
                suffixIcon: widget.suffixIcon,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                hintText: widget.hint,
                hintStyle: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: SkipassSizes.textMiniTitleSize,
                  color: Colors.grey,
                ),
              ),
          controller: widget.controller,
          inputFormatters: widget.inputFormatters,
          textInputAction: widget.textInputAction,
          textCapitalization: widget.textCapitalization,
          validator: widget.validator,
          onFieldSubmitted: widget.onFieldSubmitted,
          readOnly: widget.readOnly,
          onSaved: widget.onSaved,
          onTap: widget.onTap,
          enabled: widget.enabled,
          focusNode: widget.focusNode,
          autofocus: widget.autofocus,
          maxLength: widget.maxLength,
          autofillHints:
              widget.autoFillHints == null ? [] : [widget.autoFillHints!],
          autocorrect: false,
          style: TextStyle(
            fontSize: SkipassSizes.textMiniTitleSize,
            color: widget.readOnly
                ? Colors.grey
                : Theme.of(context).colorScheme.onSurface,
          ),
          keyboardType: widget.keyboardType,
          onEditingComplete: () {
            if (widget.onEditingComplete != null) widget.onEditingComplete!();
          },
        ),
      );

  @override
  Widget build(BuildContext context) {
    return widget.isObsecure
        ? _obsecureTextInput(context)
        : _defaultTextInput(context);
  }
}
