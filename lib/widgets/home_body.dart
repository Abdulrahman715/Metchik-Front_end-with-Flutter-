import 'package:flutter/material.dart';
import 'package:metchik/constants.dart';
import 'package:metchik/views/login_view.dart';
import 'package:metchik/views/products_view.dart';
import 'package:metchik/views/register_view.dart';
import 'package:metchik/widgets/custom_elevated_button.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 50),
            Image.network(kLogo, width: 400),
            SizedBox(height: 20),
            CustomElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, ProductsView.id);
              },
              word: 'Guest',
            ),
            CustomElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, RegisterView.id);
              },
              word: 'Register',
            ),
            CustomElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, LoginView.id);
              },
              word: 'Login',
            ),
          ],
        ),
      ),
    );
  }
}
