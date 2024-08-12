

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
      constraints: BoxConstraints(maxWidth: MediaQuery.sizeOf(context).width),
      child: Container(
        alignment: Alignment.center,
        width: SizedBox.fromSize(child: const SizedBox.expand()).width,
        decoration: BoxDecoration(
          color: widget.isError ? Colors.red.shade50 : Colors.green.shade50,
          borderRadius: BorderRadius.circular(7)      
        ),
        padding: const EdgeInsets.symmetric(vertical:17, horizontal: 25),
        margin: const EdgeInsets.only(right: 10),
      
        child: Text(
            widget.toastMessage,
            style: widget.isError ? TextStyle(color: Colors.red.shade900) : TextStyle(color: Colors.green.shade900),
            textAlign: TextAlign.center,  
          ),
      ),
    );
  }
}

