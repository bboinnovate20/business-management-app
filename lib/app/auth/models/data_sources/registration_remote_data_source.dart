
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nex_spot_app/app/auth/models/data/register.dart';
import 'package:nex_spot_app/cores/common/returned_status.dart';
import 'package:nex_spot_app/cores/constants/database.dart';

class RegistrationRemoteDataSource {

    

    registerUser(UserPersonalData userPersonAccountDetail) async {
    
    }

    uploadUserLogo() {
      
    }

    uploadUserSignature() {
      
    }


}



class FirebaseRegistrationDataSource implements RegistrationRemoteDataSource {
  
  const FirebaseRegistrationDataSource({required this.instance});

  final FirebaseAuth instance;

  @override
  Future<ReturnedStatus> registerUser(UserPersonalData userPersonAccountDetail) async {
      try {
          final credential = await instance.createUserWithEmailAndPassword(
            email: userPersonAccountDetail.email,
            password: userPersonAccountDetail.password,
          );

          await credential.user?.updateDisplayName("${userPersonAccountDetail.firstName} ${userPersonAccountDetail.lastName}");
          
          return ReturnedStatus.returnedStatus(
            message: 'Successfully created user Account', 
            success: true, data: credential.user, otherData: 
              {'firstName': userPersonAccountDetail.firstName, 
              'lastName': userPersonAccountDetail.lastName});

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

  @override
  uploadUserLogo() {
    
    throw UnimplementedError();
  }




  @override
  uploadUserSignature() {
    throw UnimplementedError();
  }

}



