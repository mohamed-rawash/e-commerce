import 'package:e_commerce/constance.dart';
import 'package:flutter/material.dart';


class CustomSocialButton extends StatelessWidget {

  final String text;
  final onPressed;
  final icon;
  final color;

  CustomSocialButton(
      {
        required this.text,
        required this.onPressed,
        required this.icon,
        required this.color
      }
      );

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: icon,
      label: Text(
        text,
        style: Theme.of(context).textTheme.headline3,
        textAlign: TextAlign.center,
      ),
      style: TextButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 60),
        elevation: 6,
      ),
      onPressed: onPressed,
    );
  }
}
