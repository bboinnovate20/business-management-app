import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nex_spot_app/cores/common/preload.dart';
import 'package:nex_spot_app/cores/constants/routes_constant.dart';
import 'package:rive/rive.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}




class _SplashScreenState extends State<SplashScreen> {
  
  moveToNextDashBoard() {
    //
    Future.delayed(const Duration(seconds: 3), () => Navigator.pushNamed(context, NamedRoutes.register));
  }

  @override
  void initState() {
    super.initState();
    moveToNextDashBoard();
    preload();
  }


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SizedBox(
                  width: 200,
                  height: 200,
                  child: Center(
                          // child: Text("hello"),
                      child: RiveAnimation.asset('assets/animations/logo.riv'),
                  ),),
      ),
    );
  }
}