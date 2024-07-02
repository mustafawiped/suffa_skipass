import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  final bool isActive;
  const Indicator({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(
        left: 1,
      ),
      width: isActive ? 15.0 : 5.0,
      height: 6.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.grey,
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }
}
