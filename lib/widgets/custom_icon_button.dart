import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final String? tooltip;

  const CustomIconButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    // بنعرف إحنا في Light ولا Dark حالياً
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return IconButton(
      onPressed: onPressed,
      tooltip: tooltip,
      icon: Icon(icon),
      style: ButtonStyle(
        shape: const WidgetStatePropertyAll(CircleBorder()),
        padding: const WidgetStatePropertyAll(EdgeInsets.all(12)),

        // الخلفية: سوداء في الـ Light، وبيضاء في الـ Dark
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.pressed)) {
            return isDarkMode ? Colors.white70 : Colors.black87;
          }
          return isDarkMode ? Colors.white : Colors.black87;
        }),

        // الأيقونة: بيضاء في الـ Light، وسوداء في الـ Dark
        foregroundColor: WidgetStatePropertyAll(
          isDarkMode ? Colors.black : Colors.white,
        ),
      ),
    );
  }
}
