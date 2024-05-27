import 'package:firebase_core/firebase_core.dart';
import 'package:nex_spot_app/app/auth/models/data_sources/login_remote_data_source.dart';
import 'package:nex_spot_app/app/auth/models/data_sources/registration_remote_data_source.dart';
  
class AuthRemoteDataSource {

  AuthRemoteDataSource(this.loginRemoteDataSource, this.registrationRemoteDataSource);

  final LoginRemoteDataSource loginRemoteDataSource;
  final RegistrationRemoteDataSource registrationRemoteDataSource;

} 