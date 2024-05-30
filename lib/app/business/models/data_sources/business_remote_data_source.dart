
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nex_spot_app/app/business/models/data/business.dart';
import 'package:nex_spot_app/cores/common/return_error_thrown.dart';
import 'package:nex_spot_app/cores/common/returned_status.dart';
import 'package:nex_spot_app/cores/constants/database.dart';

class UserBusinessRemoteDataSource {
  const UserBusinessRemoteDataSource({this.userId, required this.database});
  
  final int? userId;
  final FirebaseFirestore database;


  registerBusiness(UserBusinessDetails userBusinessDetails){}
  
  registerUserBusiness(String createdBusinessId){}

  getUserBusinesses(){}

}


class FirebaseUserBusinessRemoteDataSource implements UserBusinessRemoteDataSource {
  
    const FirebaseUserBusinessRemoteDataSource({this.userId, required this.database});

    @override
  final int? userId;
    @override
  final FirebaseFirestore database;
    
 
    @override
    Future<ReturnedStatus> getUserBusinesses() async {
      if(userId == null) return userNotExistThrow();
    
      try {
        final DocumentReference getUserBusinessDoc = database.collection(DatabaseCollection.userBusinessColl).doc(userId.toString());
        final getBusinessDetails = await getUserBusinessDoc.get();

        final getUserBusinessData = getBusinessDetails.data() as Map<String, dynamic>;
        
        if(getUserBusinessData.isEmpty) {
            ReturnedStatus.returnedStatus(message: 'User business not exist', success: false);
        }

        return ReturnedStatus.returnedStatusOther(message: 'User Business Fetched', success: true, otherData: getUserBusinessData);

      } catch (e) {
        return const ReturnedStatus('Something went wrong, try again', false, null);
      }

    }

    @override
    Future<ReturnedStatus> registerUserBusiness(String createdBusinessId) async {
      
      if(userId == null) return userNotExistThrow();

      try {
          database.collection(DatabaseCollection.userBusinessColl).doc(userId.toString()).set({'businesses': [createdBusinessId]});
          return ReturnedStatus.returnedStatusOther(message: 'User Business Successfully created', success: true, otherData: {'id': userId});  

      } catch (e) {
          return ReturnedStatus.returnedStatus(message: 'Error creating User Business', success: false);  
      }

     
    }

  

    @override
    Future<ReturnedStatus> registerBusiness(UserBusinessDetails businessDetails) async {
      try {
          final registerBusinessResponse  = await database.collection(DatabaseCollection.businessColl).add(businessDetails.toJson());
          final response = await registerBusinessResponse.get();
          final businessData = response.data();

          return ReturnedStatus.returnedStatusOther(
            message: 'Successfully register Business',
            success: true,
            otherData: {'businessId': registerBusinessResponse.id, 'businessInfo': businessData}
          );
      } catch (e) {
        const ReturnedStatus('Something went wrong, try again', false, null);
      }

      return ReturnedStatus.returnedStatus(message: 'Unable to register business', success: false);
    }

}

