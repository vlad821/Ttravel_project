import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/app_colors.dart';

class MyRoundedContainerWithIcon extends StatelessWidget {
  final IconData iconData; 
  const MyRoundedContainerWithIcon({super.key, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(color: notActiveElementColor),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: InkWell(
          onTap: () {},
          child: Center(
            child: Icon(
              iconData, 
              size: 16,
              color: borderAndIconColor,
            ),
          ),
        ),
      ),
    );
  }
}
