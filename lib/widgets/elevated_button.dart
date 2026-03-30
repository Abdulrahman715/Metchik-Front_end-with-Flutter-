import 'package:flutter/material.dart';
import 'package:metchik/constants.dart';

class AnotherCustomElevatedButton extends StatelessWidget {
  const AnotherCustomElevatedButton({
    super.key,
    this.onPressed,
    required this.buttonText,
  });

  final void Function()? onPressed;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 90 , vertical: 20),
          backgroundColor: kPrimaryColor,
          foregroundColor: Colors.white,
          textStyle: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w300,
          )
        ),
        onPressed: onPressed, 
        child: Text(buttonText)
      ),
    );
  }
}
