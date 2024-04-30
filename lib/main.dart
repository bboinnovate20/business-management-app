import 'package:flutter/material.dart';
import 'package:nex_spot_app/app/onboarding/views/onboarding_screen.dart';
import 'package:nex_spot_app/cores/routes/routes.dart';
import 'package:nex_spot_app/cores/themes/themes.dart';

import 'app/auth/views/signup_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      darkTheme: fontThemeDark(),
      theme: fontTheme(),                                  
      home: const SignUp(),
      initialRoute: '/welcome',
      onGenerateRoute: onGenerateRoute,
    );
  }
}