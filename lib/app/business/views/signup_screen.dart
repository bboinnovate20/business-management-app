import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nex_spot_app/app/auth/auth_controller.dart';
import 'package:nex_spot_app/app/auth/views/widget/setup_business_page.dart';
import 'package:nex_spot_app/app/auth/views/widget/upload_section_page.dart';
import 'package:nex_spot_app/cores/common/widget/custom_container.dart';
import 'package:nex_spot_app/cores/routes/screen_args.dart';

import 'widget/create_personal_account_page.dart';
import 'widget/signup_indicator.dart';




class SignUp extends ConsumerStatefulWidget {
  const SignUp({super.key, this.stage });

  final ScreenArgument? stage;
  
  @override
  ConsumerState<SignUp> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {

    late PageController _pageViewController;
    final totalStage = 3;
    int currentStage = 0;
    


  goToNextPage() {    
    int nextStage = currentStage + 1;
    //
    if(nextStage == totalStage) {
      //to to success page
    }
    if(nextStage == totalStage || nextStage < 0) return;

    _pageViewController.animateToPage(nextStage, 
          duration: const Duration(milliseconds: 100), curve: Curves.easeIn);
    
    setState(() => currentStage = nextStage);
  }


  @override
  void initState() {
    _pageViewController = PageController(initialPage: widget.stage?.others?['stage'] ?? 0);
    setState(() => currentStage = widget.stage?.others?['stage'] ?? 0);
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return CustomContainer(
      withMargin: false,
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        
        children: [
           SignUpIndicator(
            noOfStages: totalStage,
            initialStage: currentStage+1,
          ),
          //  Text("${ModalRoute.of(context)!.settings.arguments}"),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(right: 18, left: 18, top: 30),
              child: PageView(
                controller: _pageViewController,
                physics: const NeverScrollableScrollPhysics(),
              children:  [
                CreatePersonalAccount(stage: 0, onCompletion: goToNextPage, registerController: RegisterController(ref)),
                SetupBusiness(stage: 1, onCompletion: goToNextPage),
                UploadSection(stage: 2, onCompletion: goToNextPage),
              ]
              )),
          )
        ],
      ),
    );
  }
}
