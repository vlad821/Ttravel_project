
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/app_colors.dart';
class StepBlock extends StatelessWidget {
  final bool isActive;
  final bool isNextActive;
  const StepBlock({super.key, required this.isActive, required this.isNextActive});
  @override
  Widget build(BuildContext context) {
    return Container(
          width: isActive ? 80 : 15,
          height: 6.0,
          margin: const EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            color: isActive ? activeElementColor : notActiveElementColor,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: isActive
                ? 48.0
                : isNextActive
                    ? 32.0
                    : 40.0,
            curve: Curves.easeInOut,
          ),
    );
  }
}
