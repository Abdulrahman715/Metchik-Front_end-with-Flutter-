import 'package:flutter/material.dart';
import 'package:metchik/widgets/custom_text_form_field.dart';

class CustomLoginFields extends StatelessWidget {
  const CustomLoginFields({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column( // شيلنا الـ SingleChildScrollView لأن الأب (RegisterBody) فيه واحد أصلاً
        children: [
          const SizedBox(height: 20),
          CustomTextFormField(
            controller: emailController,
            labelText: 'Email',
            hintText: 'enter your email',
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 20),
          CustomTextFormField(
            controller: passwordController,
            labelText: 'Password',
            hintText: 'make it difficult',
            keyboardType: TextInputType.visiblePassword,
            // تأكد إن الـ CustomTextFormField بتاعك بيدعم obscureText للباسورد
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}