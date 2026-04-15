import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metchik/constants.dart';
import 'package:metchik/cubit/cart/cart_cubit.dart';
import 'package:metchik/cubit/favoutites/favourites_cubit.dart';
import 'package:metchik/cubit/theme_cubit.dart';
import 'package:metchik/firebase_options.dart';
import 'package:metchik/views/favourites_view.dart';
import 'package:metchik/views/home_view.dart';
import 'package:metchik/views/login_view.dart';
import 'package:metchik/views/product_details.dart';
import 'package:metchik/views/products_view.dart';
import 'package:metchik/views/profile_view.dart';
import 'package:metchik/views/register_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiBlocProvider(
      providers: [
        // الـ Cubit المسؤول عن الثيم (الغامق والفاتح)
        BlocProvider<ThemeCubit>(create: (context) => ThemeCubit()),
        // الـ Cubit المسؤول عن قائمة المفضلة
        BlocProvider<FavouritesCubit>(create: (context) => FavouritesCubit()),

        // الـ Cubit المسؤول عن قائمة الكارت
        BlocProvider<CartCubit>(create: (context) => CartCubit()),
      ],
      child: const Metchik(),
    ),
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
            ProductDetails.id: (context) => ProductDetails(),
            FavouritesView.id: (context) => FavouritesView(),
            ProfileView.id: (context) => ProfileView(),
          },
          initialRoute: HomeView.id,
        );
      },
    );
  }
}
