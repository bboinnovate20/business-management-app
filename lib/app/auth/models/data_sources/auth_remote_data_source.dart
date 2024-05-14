import 'package:firebase_core/firebase_core.dart';
import 'package:nex_spot_app/firebase_options.dart';

class AuthRemoteDataSource {
  init() async {
      return await Firebase.initializeApp(
              options: DefaultFirebaseOptions.currentPlatform,
            );
  }


  
} 