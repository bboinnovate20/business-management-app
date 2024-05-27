import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nex_spot_app/app/auth/models/data/register.dart';
import 'package:nex_spot_app/app/auth/models/data/user.dart';
import 'package:nex_spot_app/app/auth/models/data_sources/auth_remote_data_source.dart';
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

  Future<ReturnedStatus> registerUser(Map<String,String> userJSONData) async {
    UserPersonalData userPersonalData = UserPersonalData.fromJson(userJSONData);
    final register = await  _controllerRef.read(registerRepositoryProvider).registerUser(userPersonalData);

    if(register.success) {
      UserCredential userData = register.data!;
      _controllerRef.read(userStateNotifierProvider.notifier).update(UserState(
        isAuthenticated: register.success,
        firstName: userData.user?.displayName ?? "",
        lastName: userData.user?.displayName ?? ""));
    }
    print(register.data!);
    return register;
  }

}
