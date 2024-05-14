import 'package:firebase_core/firebase_core.dart';
import 'package:nex_spot_app/firebase_options.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:nex_spot_app/app/auth/models/data_sources/auth_remote_data_source.dart';

part 'user_auth_repository.g.dart';

@riverpod
UserAuthenticationRepository userAuthenticationRepository(UserAuthenticationRepositoryRef ref) {

  return const UserAuthenticationRepository();
}

class UserAuthenticationRepository {
  const UserAuthenticationRepository({this.authRemoteDataSource});

  final AuthRemoteDataSource? authRemoteDataSource;

  init() async {
    try {
      return await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
      );
    }catch(e) {
      return false;
    }
  }

  checkIfBusinessInfoCreated(int userId) {
      return false;
  }

}


