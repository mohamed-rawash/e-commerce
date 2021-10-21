import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {

  final String text;
  final onPressed;


  CustomButton(
      {
        required this.text,
        required  this.onPressed
      }
      );

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline4,
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.greenAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      ),
      onPressed: onPressed,
    );
  }
}
