import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metchik/cubit/theme_cubit.dart';

// ignore: must_be_immutable
class CustomSwitchSettingOption extends StatelessWidget {
  CustomSwitchSettingOption({
    super.key,
    required this.onTap,
    required this.icon,
    required this.title,
    this.isDark = false,
  });

  final VoidCallback onTap;
  final IconData icon;
  final String title;
  bool isDark;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, theme) {
        return ListTile(
          // عند الضغط عليه
          onTap: onTap,

          // prefix icon
          leading: Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Color(0xFFF8F8F8),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 22),
          ),

          // اسم الحاجة اللى هغيرها
          title: Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),

          // العلامة اللى فى اخر الصف
          trailing: isDark
              ? Switch(
                  value: Theme.brightnessOf(context) == Brightness.dark,
                  onChanged: (value) =>
                      context.read<ThemeCubit>().toggleTheme(isDark),
                )
              : Switch(value: true, onChanged: (v) {}),
        );
      },
    );
  }
}
