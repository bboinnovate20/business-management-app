import 'package:flutter/material.dart';
import 'package:nex_spot_app/app/auth/auth_controller.dart';
import 'package:nex_spot_app/app/auth/models/repositories/user_auth_repository.dart';
import 'package:nex_spot_app/app/auth/views/login_screen.dart';

import 'package:nex_spot_app/app/auth/views/signup_screen.dart';
import 'package:nex_spot_app/app/onboarding/views/onboarding_screen.dart';
import 'package:nex_spot_app/app/welcome/splash_screen_controller.dart';
import 'package:nex_spot_app/app/welcome/views/splash_screen.dart';
import 'package:nex_spot_app/cores/common/widget/success.dart';
import 'package:nex_spot_app/cores/constants/routes_constant.dart';
import 'package:nex_spot_app/cores/routes/screen_args.dart';

class CustomNamedRoute {
  const CustomNamedRoute(this.routeName, this.routeArgument);

  final String routeName;
  final ScreenArgument? routeArgument;
}


Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  ScreenArgument? args; 
  

  if(settings.arguments != null) {
    args = settings.arguments as ScreenArgument;
  }
  if(settings.name == NamedRoutes.success) {
    return  MaterialPageRoute(builder: (context) =>Success(arguments: args));
  }

  if(settings.name == NamedRoutes.welcome) {
  
    return  MaterialPageRoute(builder: (context) =>const SplashScreen()); 
  }
  
  if(settings.name == NamedRoutes.onboarding) {
    return  MaterialPageRoute(builder: (context) =>const Onboarding());
  }
  if(settings.name == NamedRoutes.register) {
    return  MaterialPageRoute(builder: (context) =>  SignUp(stage: settings.arguments as ScreenArgument));
  }
  if(settings.name == NamedRoutes.login) {
    return  MaterialPageRoute(builder: (context) =>const Login());
  }
  
  return null;
}