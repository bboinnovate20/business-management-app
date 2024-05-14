import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:nex_spot_app/app/welcome/splash_screen_controller.dart';
import 'package:nex_spot_app/cores/common/preload.dart';

import 'package:rive/rive.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key, required this.splashScreenController});

  final SplashScreenController splashScreenController;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  
  moveToNextScreen() {
    widget.splashScreenController.initiateAuthentication(ref, context);
  }

  @override
  void initState() {
    super.initState();
    preload();
    moveToNextScreen();
  }


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SizedBox(
                  width: 200,
                  height: 200,
                  child: Center(
                      child: RiveAnimation.asset('assets/animations/logo.riv'),
                  ),),
      ),
    );
  }
}