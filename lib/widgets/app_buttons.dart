// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/widgets/app_text.dart';

class AppButton extends StatelessWidget {
  final Color color;
  final Color backgroundColor;
  final Color borderColor;
  double size;
  String? text;
  IconData? icon;
  bool? isIcon;

  AppButton(
      {super.key,
      this.isIcon = false,
      this.text = "Hi",
      this.icon,
      required this.color,
      required this.backgroundColor,
      required this.borderColor,
      required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          border: Border.all(color: borderColor, width: 1.0),
          borderRadius: BorderRadius.circular(15),
          color: backgroundColor),
      child: isIcon == false
          ? Center(
              child: AppText(
              text: text!,
              color: color,
            ))
          : Center(
              child: Icon(
              icon,
              color: color,
            )),
    );
  }
}
