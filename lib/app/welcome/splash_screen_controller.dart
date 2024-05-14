import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nex_spot_app/app/auth/models/data/user.dart';
import 'package:nex_spot_app/app/auth/models/repositories/user_auth_repository.dart';
import 'package:nex_spot_app/app/auth/provider/user_state_notifier.dart';
import 'package:nex_spot_app/cores/constants/routes_constant.dart';

class SplashScreenController {
  const SplashScreenController(
    this.userAuthenticationRepository
  );

  final UserAuthenticationRepository userAuthenticationRepository;

  initiateAuthentication(WidgetRef ref, BuildContext context) {
      FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
          if (user != null) {
            ref.read(userStateNotifierProvider.notifier).update(const UserState(firstName: "Ibrahim", lastName: "Musa"));
            if(isUserBusinessRegistered()) {
              Future.delayed(const Duration(seconds: 4), () => Navigator.pushNamed(context, NamedRoutes.onboarding));  
            }
            else {
              Future.delayed(const Duration(seconds: 4), () => Navigator.pushNamed(context, NamedRoutes.onboarding));  
            }
          } else {
            //go to sign up state
            
            Future.delayed(const Duration(seconds: 4), () => Navigator.pushNamed(context, NamedRoutes.onboarding));
          }
      });
  }

  isUserBusinessRegistered() {
    return true;
  }
}