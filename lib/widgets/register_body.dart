import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metchik/cubit/auth/auth_cubit.dart';
import 'package:metchik/cubit/auth/auth_states.dart';
import 'package:metchik/helpers/show_snack_bar_message.dart';
import 'package:metchik/views/products_view.dart';
import 'package:metchik/widgets/custom_different_option.dart';
import 'package:metchik/widgets/custom_register_fields.dart';
import 'package:metchik/widgets/elevated_button.dart';
import 'package:metchik/widgets/register_and_login_image.dart';

class RegisterBody extends StatefulWidget {
  const RegisterBody({super.key});

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  //! القيم االى هيكتبها المستخدم
  final TextEditingController emailController = TextEditingController();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController roleController = TextEditingController();

  //! مفتاح الفورم علاشن الفاليديشون
  final GlobalKey<FormState> formKey = GlobalKey();

  //! علاشن اليوزر لما يختار يوزر عادى ولا اونر
  String? selectedRole;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              RegisterAndLoginImage(headText: 'Create Account '),

              // هنعدل الـ Widget ده يتقبل الـ Controllers
              CustomRegisterFields(
                emailController: emailController,
                passwordController: passwordController,
                nameController: nameController,
                phoneController: phoneController,
                onRoleChanged: (role) {
                  setState(() {
                    // استخدمنا setState عشان نحدث الـ UI لما يختار
                    selectedRole = role;
                  });
                },
              ),

              BlocConsumer<AuthCubit, AuthState>(
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
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        if (selectedRole != null) {
                          context.read<AuthCubit>().requisterUser(
                            email: emailController.text,
                            password: passwordController.text,
                            name: nameController.text,
                            phone: phoneController.text,
                            role: selectedRole!,
                          );
                        } else {
                          showSnackBarMessage(
                            context,
                            message: "Please select who you are!",
                          );
                        }
                      }
                    },
                    buttonText: 'Register',
                  );
                },
              ),

              SizedBox(height: 20),

              CustomDifferentOption(
                sentence: "Don't have an account?",
                anotherOption: "Sign Up",
                onTap: () {},
              ),

              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
