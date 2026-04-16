import 'package:flutter/material.dart';

AppBar customSettingAppBar({
  required VoidCallback searchOnPressed,
  required VoidCallback readOnPressed,
  required VoidCallback onBackPressed,
}) {
  return AppBar(
    centerTitle: true,
    actionsPadding: const EdgeInsets.symmetric(horizontal: 16),
    // titleSpacing: 20,
    leading: IconButton(
      onPressed: onBackPressed,
      icon: Icon(Icons.arrow_circle_left_rounded),
    ),
    title: const Text(
      'Settings',
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    ),
    actions: [
      IconButton(
        icon: const Icon(Icons.search_off_sharp, size: 30),
        onPressed: searchOnPressed,
      ),
      IconButton(
        icon: const Icon(Icons.read_more_outlined, size: 30),
        onPressed: readOnPressed,
      ),
    ],
  );
}
