
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nex_spot_app/app/auth/models/data/register.dart';
import 'package:nex_spot_app/cores/common/returned_status.dart';

class RegistrationRemoteDataSource {
  
    Future<ReturnedStatus> registerUser(UserPersonalData userPersonAccountDetail) async {
      try {
          final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: userPersonAccountDetail.email,
            password: userPersonAccountDetail.password,
          );
          return ReturnedStatus.returnedStatus(
            message: 'Successfully created user Account', 
            success: true, data: credential);

        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            return ReturnedStatus.returnedStatus(
            message: 'Password is weak', success: false);
          } else if (e.code == 'email-already-in-use') {
            return ReturnedStatus.returnedStatus(message: 'The account already exists for that email.', success: false);
          }
        } catch (e) {
            return ReturnedStatus.returnedStatus(message: 'Unknown error', success: false);
        }
      return ReturnedStatus.returnedStatus(message: 'Unknown error', success: false);
    }
      

    registerUserBusiness(int userId, Map<String, dynamic> userLoginData) {
      
    }

    uploadUserLogo() {
      
    }

    uploadUserSignature() {
      
    }
}

