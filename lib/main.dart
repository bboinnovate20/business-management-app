import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nex_spot_app/firebase_options.dart';


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
    // GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
    return MaterialApp.router(
      builder: FToastBuilder(),
      debugShowCheckedModeBanner: false,
      title: 'NexSpot App',
      darkTheme: fontThemeDark(),
      theme: fontTheme(),              
      routerConfig: goRouter(),                 
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

