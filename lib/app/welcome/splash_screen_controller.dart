// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nex_spot_app/app/auth/models/data/user.dart';
import 'package:nex_spot_app/app/auth/provider/user_state_notifier.dart';
import 'package:nex_spot_app/app/business/provider/repository/user_business_repository_provider.dart';
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

  initiateAuthentication(BuildContext context) async {
          final user = FirebaseAuth.instance.currentUser;
          
          
          if (user != null) {
            final userData = UserState(
                      userId: user.uid,
                      firstName: user.displayName?.split(' ')[0] ?? "", 
                      lastName: user.displayName?.split(' ')[0] ?? "", 
                      email: user.email ?? "",
                      isAuthenticated: true);
             
             await Future.microtask(() async {
                 await _controllerRef.read(userStateNotifierProvider.notifier).update(userData);
             });

            if(await isUserBusinessRegistered()) {
              Future.delayed(const Duration(seconds: 4), ()  {
                context.go(NamedRoutes.dashboard);
              });  
            }

            else {
              Future.delayed(const Duration(seconds: 4), () async {
            
                CustomToast(Navigator.of(context)).showErrorMessage(Messages.businessError);             
                context.go(NamedRoutes.register, extra: const ScreenArgument(others: {'stage': 1}) );
                // Navigator.pushNamed(context, NamedRoutes.register, arguments: const ScreenArgument(others: {'stage': 1}));
              });  
            }

          } else {
            //go to sign up state            
            Future.delayed(const Duration(seconds: 4), () => context.go(NamedRoutes.onboarding));
          }
      
  }

  isUserBusinessRegistered() async {
    // get the business of the userid
    final user = await _controllerRef.read(userBusinessRepositoryProvider).getUserBusiness();
    return user.success;
  }
}