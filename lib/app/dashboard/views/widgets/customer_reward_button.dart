import 'package:flutter/material.dart';
import 'package:nex_spot_app/app/dashboard/views/home_screen.dart';
import 'package:nex_spot_app/cores/utils/extension.dart';

class CustomerRewardButton extends StatelessWidget {
  const CustomerRewardButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      clipBehavior: Clip.none,
      children: [
        
        Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        decoration: BoxDecoration(
           gradient:  LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              context.colorScheme.primary,
              context.colorScheme.secondary,
            ]
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child:  Align(
          alignment: Alignment.centerLeft,
          child: SizedBox(
            width: MediaQuery.of(context).size.width /1.6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Reward your Customers!", style: context.textTheme.displayMedium?.copyWith(fontSize: 19, color: Colors.white)),
                const Text("Reward your Special Ones!", style: TextStyle(color: Colors.white70),)
              ],
            ),
          ),
        ),
      ),
       Positioned(
          right: 0,
          bottom: 20,
          child: Image.asset('assets/images/reward.png', width: 70)),

      
      ],
    );
  }
}