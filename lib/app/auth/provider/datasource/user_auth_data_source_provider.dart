
import 'package:nex_spot_app/app/auth/models/data_sources/auth_remote_data_source.dart';
import 'package:nex_spot_app/app/auth/models/data_sources/login_remote_data_source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/data_sources/registration_remote_data_source.dart';

part 'user_auth_data_source_provider.g.dart';

@riverpod
AuthRemoteDataSource authRemoteDataSource(AuthRemoteDataSourceRef ref) {
  return AuthRemoteDataSource();
}


@riverpod
RegistrationRemoteDataSource registrationRemoteDataSource(RegistrationRemoteDataSourceRef ref) {
  return RegistrationRemoteDataSource();
}

@riverpod
LoginRemoteDataSource loginRemoteDataSource(LoginRemoteDataSourceRef ref) {
  return LoginRemoteDataSource();
}





// UserRepository userRepository() {
//   final loginRepo
//   return UserRepository(loginRepository, registrationRepository)
// }