import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomPositioned extends StatelessWidget {
  CustomPositioned({
    super.key,
    required this.image,
    this.valueOfLeft,
    this.valueOfRight,
    this.valueOfTop,
  });

  final String image;
  double? valueOfLeft;
  double? valueOfRight;
  double? valueOfTop;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: valueOfLeft,
      right: valueOfRight,
      top: valueOfTop,
      width: 80,
      height: 200,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(image)),
        ),
      ),
    );
  }
}
