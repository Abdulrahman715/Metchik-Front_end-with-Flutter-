import 'package:flutter/material.dart';

class CustomProfileOptionsGroup extends StatelessWidget {
  const CustomProfileOptionsGroup({super.key, required this.options});

  final List<Widget> options;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(children: options),
    );
  }
}
