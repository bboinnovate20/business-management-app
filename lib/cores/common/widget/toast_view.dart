

import 'package:flutter/material.dart';

class CustomToastView extends StatefulWidget {
  const CustomToastView({super.key, required this.toastMessage, this.isError = false});

  final String toastMessage;
  final bool isError;

  @override
  State<CustomToastView> createState() => _CustomToastViewState();
}

class _CustomToastViewState extends State<CustomToastView> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(const Duration(seconds: 10), () => print('dddd'));
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 400),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: widget.isError ? Colors.red.shade50 : Colors.green.shade50,
          borderRadius: BorderRadius.circular(7)      
        ),
        padding: const EdgeInsets.symmetric(vertical:17, horizontal: 10),
      
        child: Text(
            widget.toastMessage,
            style: widget.isError ? TextStyle(color: Colors.red.shade900) : TextStyle(color: Colors.green.shade900),
            textAlign: TextAlign.center,  
          ),
      ),
    );
  }
}

