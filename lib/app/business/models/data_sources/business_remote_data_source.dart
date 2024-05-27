
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nex_spot_app/app/auth/models/data/register.dart';
import 'package:nex_spot_app/app/business/models/data/business.dart';
import 'package:nex_spot_app/cores/common/returned_status.dart';

class UserBusinessRemoteDataSource {
  
    const UserBusinessRemoteDataSource({this.userId, required this.database});

    final int? userId;
    final FirebaseFirestore database;
    
    Future<ReturnedStatus> registerUserBusiness(UserBusinessDetails userBusinessDetails) async {
      
        if(userId == null) return userNotExistThrow();
        try {
          final isUserBusinessExist = await getUserBusinesses();
          if(isUserBusinessExist.success) {
            return ReturnedStatus.returnedStatus(message: 'User Business already Exist', success: false);
          }
          
          final registerBusinessDetail = await registerBusiness(userBusinessDetails);

          if(registerBusinessDetail.success) {
            database.collection('user_businesses').doc(userId.toString()).set({'businesses': [registerBusinessDetail.otherData['businessId']]});
            return ReturnedStatus.returnedStatusOther(message: 'User Business Successfully created', success: true, otherData: {'user_business': registerBusinessDetail.otherData});  
          }

          return ReturnedStatus.returnedStatus(message: 'Error creating business', success: false);
        } 

        catch (e) {

          return unknownErrorThrow();  

        }
      
    }

    Future<ReturnedStatus> getUserBusinesses() async {
      if(userId == null) return userNotExistThrow();
    
      try {
                final DocumentReference getUserBusinessDoc = database.collection('user_businesses').doc(userId.toString());
        final getBusinessDetails = await getUserBusinessDoc.get();

        final getUserBusinessData = getBusinessDetails.data() as Map<String, dynamic>;
        
        if(getUserBusinessData.isEmpty) {
            ReturnedStatus.returnedStatus(message: 'User business not exist', success: false);
        }

        return ReturnedStatus.returnedStatusOther(message: 'User Business Fetched', success: true, otherData: getUserBusinessData);

      } catch (e) {
        return unknownErrorThrow();
      }

    }

    Future<ReturnedStatus> registerBusiness(UserBusinessDetails businessDetails) async {
      try {
          final registerBusinessResponse  = await database.collection('businesses').add(businessDetails.toJson());
          return ReturnedStatus.returnedStatusOther(
            message: 'Successfully register Business',
            success: true,
            otherData: {'businessId': registerBusinessResponse.id, 'businessInfo': registerBusinessResponse.get()}
          );
      } catch (e) {
        unknownErrorThrow();
      }

      return ReturnedStatus.returnedStatus(message: 'Unable to register business', success: false);
    }

    userNotExistThrow() {
      return const ReturnedStatus('User Not Exist', false, null);
    }

    unknownErrorThrow() {
      return const ReturnedStatus('Unknown error, please try again', false, null);
    }

    

    // getUserBusiness
}

