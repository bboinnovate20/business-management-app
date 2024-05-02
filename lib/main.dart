import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nex_spot_app/app/onboarding/views/onboarding_screen.dart';
import 'package:nex_spot_app/cores/routes/routes.dart';
import 'package:nex_spot_app/cores/themes/themes.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'app/auth/views/signup_screen.dart';
import 'cores/constants/routes_constant.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.white));

  runApp(const MyApp());
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




