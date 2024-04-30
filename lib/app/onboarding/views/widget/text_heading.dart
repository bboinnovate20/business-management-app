import 'package:flutter/material.dart';

class TextHeading extends StatelessWidget {
  const TextHeading({super.key, required this.text, required this.endText, required this.subText});

  final String text;
  final String endText;
  final String subText;

  @override
  Widget build(BuildContext context) {
      return Center(
      child: Column(
        children: [
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: text,
            style: Theme.of(context).textTheme.headlineMedium,
            children:  <InlineSpan>[
              TextSpan(
                text: endText,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 4),
          child: Text(subText,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.black54),
          ))
        ],
      ),
    );
 
  }
}