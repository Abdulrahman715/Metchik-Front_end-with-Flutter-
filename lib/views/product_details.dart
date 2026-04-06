import 'package:flutter/material.dart';
import 'package:metchik/widgets/custom_product_details_body.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  static const String id = 'product_details';

  @override
  Widget build(BuildContext context) {
    if (ModalRoute.of(context)?.settings.arguments == null) {
      return Scaffold(
        body: Center(
          child: Text(
            'No product details provided.',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
        ),
      );
    }
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (bool didPop , Object? result) {
        //? This callback is invoked when the user tries to pop the screen (e.g., by pressing the back button)
        //? You can perform any necessary cleanup or state updates here before the screen is popped
        if(didPop) return;
      },
      child: Scaffold(
        body: CustomProductDetailsBody()
      ),
    );
  }
}
