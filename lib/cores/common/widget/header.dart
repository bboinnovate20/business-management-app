import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({super.key, required this.title, required this.subTitle});

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return  SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom:5.0),
            child: Text(title, style: textTheme.headlineMedium),
          ),
          Text(subTitle, style: textTheme.bodyMedium?.copyWith(color: Colors.grey, fontSize: 14),)
        ],
      ),
    );
  }
}