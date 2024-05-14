import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nex_spot_app/app/auth/models/data/register.dart';
import 'package:nex_spot_app/app/auth/models/data/user.dart';
import 'package:nex_spot_app/app/auth/models/data_sources/auth_remote_data_source.dart';
import 'package:nex_spot_app/app/auth/models/repositories/user_auth_repository.dart';
import 'package:nex_spot_app/app/auth/provider/repository/user_auth_repository_provider.dart';
import 'package:nex_spot_app/cores/common/returned_status.dart';

import 'provider/user_state_notifier.dart';

class LoginController {
  //send to server 
  //updating the state
}

class RegisterController {

  const RegisterController(this._controllerRef);

  final WidgetRef _controllerRef;

  Future<ReturnedStatus> registerUser(UserPersonalData userPersonalData) {
    
    return  _controllerRef.read(registerRepositoryProvider).registerUser(userPersonalData);
  }

}

class UserAuthenticationController {
  const UserAuthenticationController(this.loginController, this.registerController);

  final LoginController? loginController;
  final RegisterController? registerController;
  


  initializeFirebaseAuthentication() {
      final remoteSource = AuthRemoteDataSource();
      const firebaseAuth = UserAuthenticationRepository();
      return firebaseAuth.init();
  }

  Future<ReturnedStatus> registerUserAndUpdateState(Map<String, String> userPersonalData, WidgetRef ref) async {
   
    final userPersonalDataNew = UserPersonalData.fromJson(userPersonalData);
    final register = await registerController!.registerUser(userPersonalDataNew);

    if(register.success) {
      UserCredential userData = register.data!;
      ref.read(userStateNotifierProvider.notifier).update(UserState(
        firstName: userData.user?.displayName ?? "",
        lastName: userData.user?.displayName ?? ""));
    }
    
    return register;
  }

}