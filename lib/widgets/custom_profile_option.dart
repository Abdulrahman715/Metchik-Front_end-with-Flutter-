import 'package:flutter/material.dart';

class CustomProfileOption extends StatelessWidget {
  const CustomProfileOption({
    super.key,
    required this.icon,
    required this.title,
    this.isLogout = false,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final bool isLogout;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          color: Color(0xFFF8F8F8),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: isLogout ? Colors.red : Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
          size: 22,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: isLogout ? Colors.red : Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: Colors.grey,
      ),
    );
  }
}
