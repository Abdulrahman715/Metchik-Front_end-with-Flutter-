import 'package:flutter/material.dart';

class CustomElevatedButton extends StatefulWidget {
  const CustomElevatedButton({super.key, this.onPressed, required this.word});

  final void Function()? onPressed;
  final String word;

  @override
  State<CustomElevatedButton> createState() => _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends State<CustomElevatedButton> {
  bool isPressed = false; // لمتابعة اللمس على الموبايل

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: GestureDetector(
        // أول ما تلمس الزرار
        onTapDown: (_) => setState(() => isPressed = true),
        // أول ما تشيل صباعك أو تسحب بعيد
        onTapUp: (_) => setState(() => isPressed = false),
        onTapCancel: () => setState(() => isPressed = false),
        onTap: widget.onPressed,
        
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150), // سرعة الاستجابة للمس
          width: double.infinity,
          height: 55,
          decoration: BoxDecoration(
            // هنا السحر: لو مضغوط يبقى أبيض، لو لأ يبقى شفاف
            color: isPressed ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.white, width: 2),
          ),
          alignment: Alignment.center,
          child: Text(
            widget.word,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              // النص يقلب أسود لما تلمس الزرار
              color: isPressed ? Colors.black : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}