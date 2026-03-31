import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metchik/constants.dart';
import 'package:metchik/cubit/theme_cubit.dart';
import 'package:metchik/firebase_options.dart';
import 'package:metchik/views/home_view.dart';
import 'package:metchik/views/login_view.dart';
import 'package:metchik/views/products_view.dart';
import 'package:metchik/views/register_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    // 1. بنحط الـ Provider في أعلى نقطة في التطبيق
    BlocProvider(create: (context) => ThemeCubit(), child: const Metchik()),
  );
}

class Metchik extends StatelessWidget {
  const Metchik({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, currentTheme) {
        return MaterialApp(
          themeMode: currentTheme,
          theme: ThemeData(
            brightness: Brightness.light,
            primaryColor: kPrimaryColor,
          ),

          darkTheme: ThemeData(
            brightness: Brightness.dark,
            primaryColor: kPrimaryColor,
          ),
          debugShowCheckedModeBanner: false,

          routes: {
            HomeView.id: (context) => HomeView(),
            ProductsView.id: (context) => ProductsView(),
            RegisterView.id: (context) => RegisterView(),
            LoginView.id: (context) => LoginView(),
          },
          initialRoute: HomeView.id,
        );
      },
    );
  }
}
