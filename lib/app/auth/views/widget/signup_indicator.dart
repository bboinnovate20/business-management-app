
import 'package:flutter/material.dart';

class SignUpIndicator extends StatelessWidget {
  const SignUpIndicator({
    super.key,
    required this.noOfStages,
    this.initialStage = 1,
  });
  
  final int noOfStages;
  final int initialStage;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return AnimatedContainer(
       duration: const Duration(seconds: 1),
       color: colorScheme.primary,
       width: ((MediaQuery.of(context).size.width / noOfStages) * initialStage) + 10,
       child:  const Padding(padding: EdgeInsets.all(2),),
       );
  }
}
