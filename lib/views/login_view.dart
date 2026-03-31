import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metchik/cubit/auth/auth_login_cubit.dart';
import 'package:metchik/widgets/login_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const String id = 'login_view';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthLoginCubit(),
      child: Scaffold(body: LoginBody()),
    );
  }
}
