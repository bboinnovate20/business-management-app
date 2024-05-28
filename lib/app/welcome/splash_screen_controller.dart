import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nex_spot_app/app/auth/models/data/user.dart';
import 'package:nex_spot_app/app/auth/provider/user_state_notifier.dart';
import 'package:nex_spot_app/cores/common/custom_toast.dart';
import 'package:nex_spot_app/cores/constants/message.dart';
import 'package:nex_spot_app/cores/constants/routes_constant.dart';
import 'package:nex_spot_app/cores/routes/screen_args.dart';

class SplashScreenController {
  const SplashScreenController(
    this._controllerRef
  );
  final WidgetRef _controllerRef;


  // final UserAuthenticationRepository userAuthenticationRepository;

  initiateAuthentication(BuildContext context) {
          final user = FirebaseAuth.instance.currentUser;

          if (user != null) {
            final userData = UserState(
                      firstName: user.displayName?.split(' ')[0] ?? "", 
                      lastName: user.displayName?.split(' ')[0] ?? "", 
                      isAuthenticated: true);
            
            if(isUserBusinessRegistered()) {
              Future.delayed(const Duration(seconds: 4), ()  {
                Navigator.pushNamed(context, NamedRoutes.onboarding);
              });  
            }

            else {
              Future.delayed(const Duration(seconds: 4), () {
                _controllerRef.read(userStateNotifierProvider.notifier).update(userData);
                CustomToast(Navigator.of(context)).showErrorMessage(Messages.businessError);
                Navigator.pushNamed(context, NamedRoutes.register, arguments: const ScreenArgument(others: {'stage': 1}));
              });  
            }

          } else {
            //go to sign up state            
            Future.delayed(const Duration(seconds: 4), () => Navigator.pushNamed(context, NamedRoutes.onboarding));
          }
      
  }

  isUserBusinessRegistered() {
    return false;
  }
}