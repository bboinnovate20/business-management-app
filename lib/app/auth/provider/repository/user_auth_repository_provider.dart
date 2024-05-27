

import 'package:nex_spot_app/app/auth/models/data_sources/registration_remote_data_source.dart';
import 'package:nex_spot_app/app/auth/models/repositories/login_repository.dart';
import 'package:nex_spot_app/app/auth/models/repositories/registration_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


part 'user_auth_repository_provider.g.dart';

@riverpod
LoginRepository loginRepository(LoginRepositoryRef ref) {
  return LoginRepository();
}

@riverpod
RegistrationRepository registerRepository(RegisterRepositoryRef ref) {
  final registerRemoteDataSource = FirebaseRegistrationDataSource();
  return RegistrationRepository(registerRemoteDataSource);
}





// UserRepository userRepository() {
//   final loginRepo
//   return UserRepository(loginRepository, registrationRepository)
// }