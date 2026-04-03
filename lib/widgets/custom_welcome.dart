import 'package:flutter/material.dart';

class CustomWelcome extends StatelessWidget {
  const CustomWelcome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome ,',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              // fontFamily: 'Passion One',
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Our Fashions App',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade800,
              // fontFamily: 'Passion One',
            ),
          ),
        ],
      ),
    );
  }
}
