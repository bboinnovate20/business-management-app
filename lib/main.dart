import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nex_spot_app/app/auth/models/repositories/user_auth_repository.dart';
import 'package:nex_spot_app/firebase_options.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


import 'package:nex_spot_app/app/auth/auth_controller.dart';
import 'package:nex_spot_app/cores/routes/routes.dart';
import 'package:nex_spot_app/cores/themes/themes.dart';

import 'cores/constants/routes_constant.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.white));

  await firebaseSetup();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

    return MaterialApp(
      builder: FToastBuilder(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      darkTheme: fontThemeDark(),
      theme: fontTheme(),                                  
      // home: const SignUp(),
      initialRoute: NamedRoutes.welcome,
      onGenerateRoute: onGenerateRoute,
      navigatorKey: navigatorKey,
    );
  }

 
}


firebaseSetup() async {
    try {
      return await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
      );
    }catch(e) {
      return false;
    }
}

