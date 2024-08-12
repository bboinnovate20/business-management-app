import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nex_spot_app/cores/constants/routes_constant.dart';
import 'package:rive/rive.dart';

import 'package:nex_spot_app/cores/common/widget/custom_container.dart';
import 'package:nex_spot_app/cores/common/widget/primary_button.dart';
import 'package:nex_spot_app/cores/routes/screen_args.dart';

class Success extends StatelessWidget {
  const   Success({super.key, this.arguments});

  final ScreenArgument? arguments;

  @override
  Widget build(BuildContext context) {
    return  CustomContainer(
              backgroundColor: Colors.purple.shade50,
              child: 
                Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Center(
                      child: SizedBox(
                        width: 200,
                        height: 250,
                        child: Center(
                          // child: Text("hello"),
                          child: RiveAnimation.asset('assets/animations/success.riv'),
                        ),
                      ),
                                          ),
                                          Text( 
                      textAlign: TextAlign.center,
                      
                      arguments?.title ?? "", style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 36, height:1.2)),
                                           Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                      child: Text(
                        style: const TextStyle(color: Colors.black45),
                        textAlign: TextAlign.center,
                        arguments?.message ?? ""),
                                          ),
                        ],
                      ), 
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: PrimaryButton(onPressed: () => context.go(NamedRoutes.dashboard), title: "Proceed to Dashboard", disabled: false)))
                  ],
                  
                  
                )
            );
  }
}