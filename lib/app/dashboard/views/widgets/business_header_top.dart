
import 'package:flutter/material.dart';
import 'package:nex_spot_app/app/dashboard/views/dashboard_screen.dart';
import 'package:nex_spot_app/cores/utils/extension.dart';

class BusinessTopHeader extends StatelessWidget {
  const BusinessTopHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        //image
        CircleAvatar(
          radius: 25,
          backgroundColor: context.colorScheme.primary,
          child: const Text("A", style: TextStyle(color: Colors.white),),
        ),
        const SizedBox(width: 10,),
         Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Optimist Decor", style: context.textTheme.titleLarge?.copyWith(fontSize: 18)),
            const Text("New Road, Lagos Island, Lagos State", style: TextStyle(color: Colors.black54),),
          ],
        )
      ],
    );
  }
}