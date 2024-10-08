
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.child,
    this.withMargin = true,
    this.bottom,
    this.backgroundColor
  });

  final Widget child;
  final bool withMargin;
  final Widget? bottom;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: bottom,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: backgroundColor,
          padding: withMargin ? const EdgeInsets.symmetric(horizontal: 18) : const EdgeInsets.all(0),  
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
    this.withMargin = true,
    this.bottom
  });

  final Widget child;
  final Widget? bottom;

  final bool withMargin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: bottom,
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