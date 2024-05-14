

import 'package:nex_spot_app/app/auth/models/repositories/login_repository.dart';
import 'package:nex_spot_app/app/auth/models/repositories/registration_repository.dart';
import 'package:nex_spot_app/app/auth/models/repositories/user_auth_repository.dart';
import 'package:nex_spot_app/app/auth/models/repositories/user_repository.dart';
import 'package:nex_spot_app/app/auth/provider/datasource/user_auth_data_source_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/data_sources/auth_remote_data_source.dart';

part 'user_auth_repository_provider.g.dart';

@riverpod
LoginRepository loginRepository(LoginRepositoryRef ref) {
  return LoginRepository();
}

@riverpod
RegistrationRepository registerRepository(RegisterRepositoryRef ref) {
  final registerRemoteDataSource = ref.watch(registrationRemoteDataSourceProvider);
  return RegistrationRepository(registerRemoteDataSource);
}

@riverpod
UserAuthenticationRepository userAuthenticationRepository(UserAuthenticationRepositoryRef ref) {
  final authRemoteDataSource = ref.watch(authRemoteDataSourceProvider);
  return UserAuthenticationRepository(
    authRemoteDataSource: authRemoteDataSource
  );
}






// UserRepository userRepository() {
//   final loginRepo
//   return UserRepository(loginRepository, registrationRepository)
// }