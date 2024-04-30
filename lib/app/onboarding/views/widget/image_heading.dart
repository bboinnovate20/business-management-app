import 'package:flutter/material.dart';

class ImageHeading extends StatelessWidget {
  const ImageHeading({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 95,
        alignment: Alignment.topLeft,
        child: ClipRect(
          child: Transform.translate(
            offset: const Offset(-20, 0),
            child: Image.asset(
              'assets/images/header_image.png',
              width: 250,
            ),
          ),
        ),
        ),
    );
  }
}