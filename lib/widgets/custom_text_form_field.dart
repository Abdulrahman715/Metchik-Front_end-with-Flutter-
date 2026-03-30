import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    this.keyboardType,
    required this.labelText,
    required this.hintText,
    this.controller,
  });

  TextInputType? keyboardType;
  final String labelText;
  final String hintText;
  TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // التعديل: التأكد من أن القيمة ليست فارغة
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field is required';
        }
        return null; // كدة مفيش خطأ
      },
      controller: controller,
      keyboardType: keyboardType,
      style: TextStyle(
        color: Colors.black,
      ),
      decoration: InputDecoration(

        contentPadding: EdgeInsets.all(8),
        labelText: labelText,
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.lightBlue),
        ),
        // الحدود لما يكون فيه خطأ
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.red),
        ),
        // الحدود لما تدوس على الحقل وفيه خطأ
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
      ),
    );
  }
}
