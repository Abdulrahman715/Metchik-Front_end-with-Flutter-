import 'package:flutter/material.dart';
import 'package:metchik/widgets/custom_text_form_field.dart';

class CustomRegisterFields extends StatelessWidget {
  const CustomRegisterFields({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.phoneController,
    required this.passwordController,
    required this.onRoleChanged,
  });

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController passwordController;
  final Function(String?) onRoleChanged; // دالة بتبعت القيمة المختارة للأب

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column( // شيلنا الـ SingleChildScrollView لأن الأب (RegisterBody) فيه واحد أصلاً
        children: [
          CustomTextFormField(
            controller: nameController,
            labelText: 'Name',
            hintText: 'enter your name',
          ),
          const SizedBox(height: 20),
          CustomTextFormField(
            controller: emailController,
            labelText: 'Email',
            hintText: 'enter your email',
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 20),
          CustomTextFormField(
            controller: phoneController,
            labelText: 'Phone',
            hintText: 'enter your number',
            keyboardType: TextInputType.phone,
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
          
          DropdownButtonFormField<String>(
            style: TextStyle(
              color: Colors.black,
            ),
            decoration: InputDecoration(
              labelText: 'Who are you?',
              labelStyle: const TextStyle(fontSize: 18 , color: Colors.black),
              contentPadding: const EdgeInsets.all(16),
              // border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
            ),
            hint: const Text('Owner & User'),
            items: const [
              DropdownMenuItem(value: 'Owner', child: Text('Store Owner')),
              DropdownMenuItem(value: 'User', child: Text('Customer')),
            ],
            onChanged: onRoleChanged, // بيبعت القيمة فوراً للـ RegisterBody
            validator: (value) => value == null ? 'Please select a role' : null,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}