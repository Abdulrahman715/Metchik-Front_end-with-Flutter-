import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metchik/cubit/auth/auth_login_cubit.dart';
import 'package:metchik/cubit/auth/auth_states.dart';
import 'package:metchik/helpers/show_snack_bar_message.dart';
import 'package:metchik/views/products_view.dart';
import 'package:metchik/views/register_view.dart';
import 'package:metchik/widgets/custom_different_option.dart';
import 'package:metchik/widgets/custom_login_fields.dart';
import 'package:metchik/widgets/elevated_button.dart';
import 'package:metchik/widgets/register_and_login_image.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  //! القيم االى هيكتبها المستخدم
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //! مفتاح الفورم علاشن الفاليديشون
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.white,
      height: double.infinity,
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              RegisterAndLoginImage(headText: 'Login '),

              // هنعدل الـ Widget ده يتقبل الـ Controllers
              CustomLoginFields(
                emailController: emailController,
                passwordController: passwordController,
              ),

              BlocConsumer<AuthLoginCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthSuccess) {
                    Navigator.pushNamed(context, ProductsView.id);
                  } else if (state is AuthFailure) {
                    showSnackBarMessage(context, message: state.errMessage);
                  }
                },
                builder: (context, state) {
                  // المنطق السليم: لو الحالة Loading أظهر الدائرة، غير كدة أظهر الزرار
                  if (state is AuthLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  // الزرار هيظهر في حالة AuthInitial أو AuthFailure أو AuthSuccess
                  return AnotherCustomElevatedButton(
                    // داخل الـ onPressed في LoginBody
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        // بننادي على الـ Cubit بتاع اللونج
                        context.read<AuthLoginCubit>().loginUser(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                      }
                    },
                    buttonText: 'Login',
                  );
                },
              ),

              SizedBox(height: 20),

              CustomDifferentOption(
                sentence: "Don't have an account?",
                anotherOption: "Sign Up",
                onTap: () {
                  Navigator.pushNamed(context,RegisterView.id);
                },
              ),

              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
