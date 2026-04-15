import 'package:flutter/material.dart';

class CustomQuantityButton extends StatelessWidget {
  const CustomQuantityButton({
    super.key,
    required this.onTap,
    required this.isOutlined,
    required this.icon,
  });

  final VoidCallback onTap;
  final bool isOutlined;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 25,
        width: 25,
        decoration: BoxDecoration(
          color: isOutlined ? Colors.transparent : Colors.black,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          color: isOutlined ? Colors.black : Colors.white,
          size: 18,
        ),
      ),
    );
  }
}
