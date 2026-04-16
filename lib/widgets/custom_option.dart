import 'package:flutter/material.dart';

class CustomOption extends StatelessWidget {
  const CustomOption({
    super.key,
    required this.icon,
    required this.title,
    this.isLogout = false,
    this.onTap,
    this.trailingText,
  });

  final IconData icon;
  final String title;
  final bool isLogout;
  final VoidCallback? onTap;
  final String? trailingText;

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
          color: isLogout
              ? Colors.red
              : Theme.of(context).brightness == Brightness.dark
              ? Colors.white
              : Colors.black,
          size: 22,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: isLogout
              ? Colors.red
              : Theme.of(context).brightness == Brightness.dark
              ? Colors.white
              : Colors.black,
        ),
      ),
      trailing: SizedBox(
        width: 80, // مساحة كافية للنص والسهم
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (trailingText != null)
              Text(
                trailingText!,
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
            const SizedBox(width: 8),
            const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
