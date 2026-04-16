import 'package:flutter/material.dart';

class CustomSettingOptionsGroup extends StatelessWidget {
  const CustomSettingOptionsGroup({super.key, required this.options});

  final List<Widget> options;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12) , color:Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.grey[200]),
      child: Column(children: options),
    );
  }
}
