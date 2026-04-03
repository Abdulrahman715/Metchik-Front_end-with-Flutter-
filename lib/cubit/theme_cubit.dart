import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metchik/helpers/theme_service.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system) {
    _loadInitialTheme();
  }

  //! اول ما التطبيق يفتح بنشوف اليوز اكن مختار ايه

  void _loadInitialTheme() async {
    bool? isDark = await ThemeService.loadTheme();

    if (isDark == null) {
      emit(ThemeMode.light);
    } else {
      emit(isDark ? ThemeMode.dark : ThemeMode.light);
    }
  }

  //! دالة لتغيير الثيم وحفظه

  void toggleTheme(bool isDark) async {
    await ThemeService.saveTheme(isDark);

    emit(isDark ? ThemeMode.dark : ThemeMode.light);
  }
}
