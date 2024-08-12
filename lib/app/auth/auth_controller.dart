import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nex_spot_app/app/auth/models/data/register.dart';
import 'package:nex_spot_app/app/auth/models/data/user.dart';
import 'package:nex_spot_app/app/auth/provider/repository/user_auth_repository_provider.dart';
import 'package:nex_spot_app/app/business/models/data/business.dart';
import 'package:nex_spot_app/app/business/provider/repository/user_business_repository_provider.dart';
import 'package:nex_spot_app/cores/common/returned_status.dart';

import 'provider/user_state_notifier.dart';

class LoginController {
  //send to server 
  //updating the state
}

class RegisterController {

  const RegisterController(this._controllerRef);

  final WidgetRef _controllerRef;

  Future<ReturnedStatus> registerUser(Map<String,String> userJSONData) async {
    UserPersonalData userPersonalData = UserPersonalData.fromJson(userJSONData);
    final register = await  _controllerRef.read(registerRepositoryProvider).registerUser(userPersonalData);

    if(register.success) {
      User userData = register.data!;
      final otherData = register.otherData;
      _controllerRef.read(userStateNotifierProvider.notifier).update(UserState(
        userId: userData.uid,
        isAuthenticated: register.success,
        email: userData.email ?? "",
        firstName: userData.displayName?.split(" ")[0] ?? otherData['firstName'],
        lastName: userData.displayName?.split(" ")[0] ?? otherData['lastName']));
    }
    return register;
  }

  registerBusiness(UserBusinessDetails userBusinessDetails) async {
    final businessRegistration = await _controllerRef.watch(userBusinessRepositoryProvider)
            .registerUserBusiness(userBusinessDetails);

    return businessRegistration;
    
  }

  Future<ReturnedStatus> uploadLogo(File path) async {
    final ReturnedStatus businessLogo = await _controllerRef.watch(userBusinessRepositoryProvider).uploadBusinessLogo(path);
    return businessLogo;
  }

   Future<ReturnedStatus> uploadSignature(File path) async {
    final ReturnedStatus businessLogo = await _controllerRef.read(userBusinessRepositoryProvider).uploadBusinessSignature(path);
    return businessLogo;
  }

}
