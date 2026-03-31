import 'package:flutter/material.dart';
import 'package:metchik/constants.dart';
import 'package:flutter/gestures.dart';

class CustomDifferentOption extends StatelessWidget {
  const CustomDifferentOption({
    super.key,
    required this.sentence,
    required this.anotherOption,
    this.onTap,
  });

  final String sentence;
  final String anotherOption;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          text: sentence,
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyLarge?.color,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          children: [
            const TextSpan(text: "  "), // مسافة
            TextSpan(
              text: anotherOption,
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: 18,
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.underline, // 👈 الخط تحتها
              ),
              recognizer: TapGestureRecognizer()..onTap = onTap, // 👈 هنا الضغط
            ),
          ],
        ),
      ),
    );
  }
}
