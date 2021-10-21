import 'package:e_commerce/constance.dart';
import 'package:flutter/material.dart';


class CustomSignButton extends StatelessWidget {

  final String text;
  final function;


  CustomSignButton(
      {
    required this.text,
    required  this.function
      }
  );

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline3,
        textAlign: TextAlign.center,
      ),
      style: TextButton.styleFrom(
        backgroundColor: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 80),
        elevation: 6,
      ),
      onPressed: function,
    );
  }
}
