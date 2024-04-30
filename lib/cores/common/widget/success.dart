import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import 'package:nex_spot_app/cores/common/widget/custom_container.dart';
import 'package:nex_spot_app/cores/common/widget/primary_button.dart';
import 'package:nex_spot_app/cores/routes/screen_args.dart';

class Success extends StatelessWidget {
  const   Success({super.key, this.arguments});

  final ScreenArgument? arguments;

  @override
  Widget build(BuildContext context) {
    return  CustomContainer(child: 
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      const SizedBox(
                        width: 250,
                        height: 300,
                        child: Center(
                          // child: Text("hello"),
                          child: RiveAnimation.asset('assets/animations/success.riv'),
                        ),
                      ),
                      Text( 
                        arguments?.title ?? "", style: Theme.of(context).textTheme.titleLarge,),
                       Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          textAlign: TextAlign.center,
                          arguments?.message ?? ""),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: PrimaryButton(onPressed: (){}, title: "Proceed to Dashboard", disabled: false)))
                    ],
                    
                    
                  ),
                )
            );
  }
}