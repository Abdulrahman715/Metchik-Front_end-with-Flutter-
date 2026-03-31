import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metchik/cubit/auth/auth_register_cubit.dart';
import 'package:metchik/widgets/register_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  static const id = 'register_view';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AuthRegisterCubit(), // هنا بنوفر الـ Cubit للصفحة دي واللي تحتها
      child: Scaffold(body: RegisterBody()),
    );
  }
}
