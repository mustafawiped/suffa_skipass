import 'package:flutter/material.dart';
import 'package:suffa_skipass/core/resources/skipass_color.dart';
import 'package:suffa_skipass/core/resources/skipass_size.dart';

class SkipassButton extends StatelessWidget {
  final double? height;
  final Function()? onPressed;
  final String text;
  final Color color;
  final Color textColor;
  final IconData? iconDT;

  const SkipassButton({
    this.height = 45,
    required this.onPressed,
    required this.text,
    this.color = SkipassColors.primaryColor,
    this.textColor = Colors.white,
    super.key,
    this.iconDT,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: textColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          shadowColor: Colors.transparent,
        ),
        child: iconDT != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style: const TextStyle(
                      fontSize: SkipassSizes.textMiniTitleSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Icon(
                    iconDT,
                    size: 16,
                  ),
                ],
              )
            : Text(
                text,
                style: const TextStyle(
                  fontSize: SkipassSizes.textMiniTitleSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
    );
  }
}
