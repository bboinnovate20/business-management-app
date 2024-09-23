import 'package:flutter/material.dart';
import 'package:nex_spot_app/cores/common/widget/primary_button.dart';
import 'package:nex_spot_app/cores/utils/extension.dart';

class TopHomeCard extends StatelessWidget {
  const TopHomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        
        borderRadius: BorderRadius.circular(10),
        // gradient: Gradient
        gradient:  LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            context.colorScheme.primary,
            context.colorScheme.secondary,
          ]
        )
      ),
      padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 20),
      child:  Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Wallet Balance", style: context.textTheme.bodySmall?.copyWith(color: Colors.white, height: 1)),
               Text("N40,000", style: context.textTheme.displaySmall?.copyWith(color: Colors.white,fontSize: 24))
            ],
          ),
          CustomButton(
            fontSize: 15,
            bgColor: Colors.white,
            color: context.colorScheme.primary,
            width: 0,
            radius: 15,
            height: 40,
            verticalPadding: 0,
            onPressed: () => {print('dd')}, title: "+ Create Invoice")
        ],
      ),
    );
  }
}


// extension TextStyle on BuildContext {
//     ColorScheme get colorScheme {
//       return Theme.of(this).colorScheme;
//     }
// } 