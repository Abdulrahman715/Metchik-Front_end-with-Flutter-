import 'package:shared_preferences/shared_preferences.dart';

class ThemeService {
  static const String _themeKey = "isDarkMode";

  // حفظ الاختيار
  static Future<void> saveTheme(bool isDark) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setBool(_themeKey, isDark);
  }

  // تحميل الاختيار
  static Future<bool?> loadTheme() async {
    final pref = await SharedPreferences.getInstance();
    // بنرجعه كـ bool (null لو أول مرة يفتح التطبيق)
    return pref.getBool(_themeKey);
  }
}