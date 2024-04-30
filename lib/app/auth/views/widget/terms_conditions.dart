import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          
          Checkbox.adaptive(
          semanticLabel: 'Do you agree to the Terms and Condition',
          value: true, 
          activeColor: colorScheme.primary,
          onChanged: (value){
          
          }),
          RichText(
            text:  TextSpan(
              style: Theme.of(context).textTheme.bodyMedium,
            text: "Agree to ",
            children: [
              TextSpan(
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: colorScheme.primary,
                ),
                text: "Terms and Condition",
                recognizer: TapGestureRecognizer()..onTap = () => debugPrint('hello')
              )
            ]
          ))
        ],
      ),
    );
  }
}