

import 'package:flutter/material.dart';

class CustomSuccessToastView extends StatelessWidget {
  const CustomSuccessToastView({super.key, required this.toastMessage});

  final String toastMessage;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 400),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.green.shade50,
          borderRadius: BorderRadius.circular(7)      
        ),
        padding: const EdgeInsets.symmetric(vertical:17, horizontal: 10),
      
        child: Text(
            toastMessage,
            style: TextStyle(color: Colors.green.shade900),
            textAlign: TextAlign.center,  
          ),
      ),
    );
  }
}



class CustomErrorToastView extends StatelessWidget {
  const CustomErrorToastView({super.key, required this.toastMessage});

  final String toastMessage;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 400),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.red.shade50,
          borderRadius: BorderRadius.circular(7)      
        ),
        padding: const EdgeInsets.symmetric(vertical:17, horizontal: 10),
      
        child: Text(
            toastMessage,
            style: TextStyle(color: Colors.red.shade900),
            textAlign: TextAlign.center
          ),
      ),
    );
  }
}
