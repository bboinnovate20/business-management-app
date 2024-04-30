
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.child,
    this.withMargin = true
  });

  final Widget child;
  final bool withMargin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        
        child: Container(
          height: MediaQuery.of(context).size.height,
          margin: withMargin ? const EdgeInsets.symmetric(horizontal: 12) : const EdgeInsets.all(0),  
          child: child,
        ),
      ),
    );
  }
}



class CustomContainerScrollable extends StatelessWidget {
  const CustomContainerScrollable({
    super.key,
    required this.child,
    this.withMargin = true
  });

  final Widget child;
  final bool withMargin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            margin: withMargin ? const EdgeInsets.symmetric(horizontal: 12) : const EdgeInsets.all(0),  
            child: child,
          ),
        ),
      ),
    );
  }
}