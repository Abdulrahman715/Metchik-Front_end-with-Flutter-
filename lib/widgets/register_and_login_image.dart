import 'package:flutter/material.dart';
import 'package:metchik/constants.dart';
import 'package:metchik/helpers/custom_positioned.dart';

class RegisterAndLoginImage extends StatelessWidget {
  const RegisterAndLoginImage({super.key, required this.headText});

  final String headText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(kBackgroundImage),
          fit: BoxFit.fill,
        ),
      ),
      child: Stack(
        children: [
          CustomPositioned(image: kLightColorImage, valueOfLeft: 30 , valueOfTop: -10,),
          CustomPositioned(
            image: kMoonImage,
            valueOfLeft: 140,
            valueOfTop: -20,
          ),
          CustomPositioned(image: kClock, valueOfRight: 40),
          Positioned(
            child: Container(
              child: Center(
                child: Text(
                  headText,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
