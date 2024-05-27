

import 'package:nex_spot_app/app/auth/models/repositories/login_repository.dart';
import 'package:nex_spot_app/app/auth/models/repositories/registration_repository.dart';

class UserAuthRepository {

  const UserAuthRepository(this.loginRepository, this.registrationRepository);

  final LoginRepository loginRepository;
  final RegistrationRepository registrationRepository;

  
}