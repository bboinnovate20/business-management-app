import 'package:nex_spot_app/app/auth/models/data/register.dart';
import 'package:nex_spot_app/app/auth/models/data_sources/registration_remote_data_source.dart';
import 'package:nex_spot_app/cores/common/returned_status.dart';

class RegistrationRepository {

    const RegistrationRepository(this.registrationRemoteDataSource);

    final RegistrationRemoteDataSource registrationRemoteDataSource; 
    
    Future<ReturnedStatus> registerUser(UserPersonalData userLogin) async {
        final ReturnedStatus response = await registrationRemoteDataSource.registerUser(userLogin);
        return response;
    }

    // registerUserBusiness(UserBusinessDetails userBusinessDetails){

    // }

    uploadBusinessLogo(int businessId) {

    }

    uploadBusinessSignature(int businessId) {

    }

    
}